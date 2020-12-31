# Stripe Docs

## 2. Stripe CLI

> [Stripe CLI Reference][stripe_cli_reference]

With Stripe CLI, you can create a lab for experimenting with stripe in a quicker manner.

You can also check on the terminal for incoming events, without the need of opening the online dashboard:

```sh
stripe listen
```

Then, in a new terminal, use, for example `stripe customers create` to create a customer or `stripe trigger payment_intent.created`, and check the event on the first terminal.


[stripe_cli_reference]: https://stripe.com/docs/cli

### 2.1. Forward events to your server

When developing an application, you’ll likely want to forward received events to your server. Do so using the `--forward-to` flag when invoking `stripe listen`:

```sh
stripe listen --forward-to localhost:5000/hooks
```

With forwarding established, events that occur continue to show in the terminal, but you’ll also see the response from your server.

### 2.2. Test and monitor your integration

```sh
stripe logs tail
```

## 3. Keys

Every account is provided with separate keys for testing and for running live transactions. All API requests exist in either test or live mode, and objects—customers, plans, coupons, and so forth—in one mode cannot be manipulated by objects in the other.

There are also two types of API keys: publishable and secret.

- **Publishable** API keys are meant solely to identify your account with Stripe, they aren’t secret. In other words, they can safely be published in places like your Stripe.js JavaScript code, or in an Android or iPhone app.
- **Secret** API keys should be kept confidential and only stored on your own servers. Your account’s secret API key can perform any API request to Stripe without restriction.

The test and live modes function almost identically, with a few necessary differences:

- In test mode, payments are not processed by card networks or payment providers, and only our test payment information can be used.
- Some payment methods using Sources have a more nuanced flow in live mode, with more steps required than those in test mode.
- Disputes also have a more nuanced flow in live mode, and a simpler testing process.
- Webhooks that were not successfully acknowledged are retried three times over a few hours (as opposed to 72 hours for live mode).

In live mode, new secret keys are only visible the first time you access them. After that, the Dashboard redacts the API key. When the key is revealed, you can leave a note on the Dashboard describing the location on your own systems where you’ve copied it. If you lose your secret key, you can’t recover it from the Dashboard and must roll the key or create another one.

A restricted key allows only the minimum level of access that the service needs while protecting account data it doesn’t need. For example, you can create a restricted key that grants read-only access to dispute data, then use it with a dispute monitoring service.

Restricted keys are intended to reduce the risk when using or building microservices. They are not to be used as an alternative to your account’s API keys during development of your Stripe integration—restricted keys cannot interact with many parts of Stripe’s API. Use your test API keys during development and live API keys once your integration is live.

## 4. Rate Limits

The Stripe API employs a number of safeguards against bursts of incoming traffic to help maximize its stability. Users who send many requests in quick succession may see error responses that show up as status code 429. We have several limiters in the API.

- rate limiter
- concurrency limiter

A basic technique for integrations to gracefully handle limiting is to watch for 429 status codes and build in a retry mechanism. The retry mechanism should follow an exponential backoff schedule to reduce request volume when necessary.

It’s common for users to prepare for a major sales event by load testing their systems, with the Stripe API running in test mode as part of it. We generally discourage this practice because API limits are lower in test mode, so the load test is likely to hit limits that it wouldn’t hit in production.

## 5. Card Testing

Card testing is a type of fraudulent activity where someone tries to determine if stolen card information can be used to make purchases.

- Higher decline rates: Card testing usually causes a large number of declines to be associated with your business.

How card testing works 

Card testers use both authorizations and payments to determine if the stolen or generated card information they have is valid or not.

- Authorizations: This is the preferred method to test cards, as authorizations don’t typically show up on cardholder statements. This also makes it less likely the cardholder will notice or report the fraudulent activity.
- Payments: Card testers prefer smaller payments, which are less likely to be noticed by cardholders and reported as fraudulent. This makes donation pages and businesses that facilitate small-value purchases ideal targets for card testers.

You can identify most card testing activity by a significant increase in declines.

Endpoints targeted by card testers typically allow them to do one of the following:

- Attach a card to a customer
- Make a payment

Security measures:

- Add a captcha
- Add rate limits
- Require login or session validation
- Detect and prevent unusual behavior
- Use Radar

### 5.1. Active card testing checklist

- Identify the card testing activity.
- Refund fraudulent payments to avoid disputes.
- Add one or more mitigations to your integration to stop the card testing.
- Monitor your integration to ensure your mitigations are effective.

## 6. Expanding Responses

Learn how to reduce the number of requests you make to the Stripe API by expanding objects in responses.

This guide describes how to request additional properties from the API. You will learn to modify your requests to include:

- properties from related objects
- properties from distantly related objects
- additional properties on all objects in a list
- properties that aren’t included by default in a response

The API has an Expand feature that allows you to retrieve linked objects in a single call, effectively replacing the object ID with all its properties and values. For example, say you wanted to access details on a customer tied to a given Checkout Session. You would retrieve the Checkout Session and pass the `customer` property to the `expand` array, which tells Stripe to include the entire Customer object in the response:

```sh
curl https://api.stripe.com/v1/checkout/sessions/cs_test_KdjLtDPfAjT1gq374DMZ3rHmZ9OoSlGRhyz8yTypH76KpN4JXkQpD2G0 \
  -u sk_test_51I1ag9L9RyDuS7hQ3oxvxPfqGtukbv4d2UyYRnou6MiMxDK8621aWfhjDEyaFejroLkzbWthrGSMUN3eZao0DutB002vNqtEGX: \
  -d "expand[]"=customer \
  -G
```

> Not all properties can be expanded. The API reference marks expandable properties with the “Expandable” label.

To expand multiple properties in one call, add additional items to the expand array.

If the value you want is nested deeply across multiple linked resources, you can reach it by recursively expanding using dot notation.

```sh
curl https://api.stripe.com/v1/checkout/sessions/cs_test_KdjLtDPfAjT1gq374DMZ3rHmZ9OoSlGRhyz8yTypH76KpN4JXkQpD2G0 \
  -u sk_test_51I1ag9L9RyDuS7hQ3oxvxPfqGtukbv4d2UyYRnou6MiMxDK8621aWfhjDEyaFejroLkzbWthrGSMUN3eZao0DutB002vNqtEGX: \
  -d "expand[]"="payment_intent.payment_method" \
  -G
```

> Expansions have a maximum depth of four levels.

When the API returns a list of objects, you can use the data keyword to expand a given property on each object in that list.

```sh
curl https://api.stripe.com/v1/payment_intents \
  -u sk_test_51I1ag9L9RyDuS7hQ3oxvxPfqGtukbv4d2UyYRnou6MiMxDK8621aWfhjDEyaFejroLkzbWthrGSMUN3eZao0DutB002vNqtEGX: \
  -d customer=cus_HQmikpKnGHkNwW \
  -d "expand[]"="data.payment_method" \
  -G
```

> All lists returned in the API have the above structure, where the `data` property contains the array of objects being listed. 

## 7. Checklist

- [ ] Set the API version
- [ ] Handle edge cases
- [ ] Review your API error handling
- [ ] Review your logging
- [ ] Ensure you're not relying on test mode objects
- [ ] Ensure you've registered your production webhooks
- [X] Subscribe to the API announcements mailing list
- [ ] Change and secure your API keys

There's also a checklist for your website:

- [ ] A description of what you are selling
- [ ] The purchase currency
- [ ] Customer service contact information
- [ ] Your fulfillment policies
- [ ] Legal or export restrictions applicable to your business
- [ ] Your website’s privacy policy
- [ ] Your business address
- [ ] The terms of any promotions you are offering
- [ ] The security of your website and customer payment information
- [ ] The logos of the credit cards you accept

## 8. Webhooks

Webhooks refers to a combination of elements that collectively create a notification and reaction system within a larger integration.

Non-metaphorically, the webhook endpoint is just more code on your server, which could be written in Ruby, PHP, Node.js, or whatever.

> Firebase Functions could a handy webhook system.

Other events that occur within a Stripe account are asynchronous: happening at a later time and not directly in response to your code’s execution. Most commonly these involve:

- The Payment Intents API
- Notifications of payouts
- Subscriptions

### 8.1. Test webhooks

There are several ways to test your webhook endpoint:

- Create test activity on your account
- Manually send test events from the Dashboard
- Use the Stripe CLI

The Stripe CLI is the easiest and fastest method for testing your webhook endpoint. With the Stripe CLI you can begin listening for–and even triggering–events without any additional configuration. This helps you easily test a webhook integration without needing to deploy your application or figure out how to open up your local environment to the public internet in order for Stripe to communicate to it.

### 8.2. Check signatures

Verify the events that Stripe sends to your webhook endpoints. This will help avoiding attacks.

### 8.3. Best Practices for Using Webhooks

- API Versions
- Event Types
- Delivery attempts and retries
    - View events 
    - Retry logic
    - Disable logic 
- Event handling
    - Handle duplicate events 
        - Idempotency   
    - Order of events
- Security
    - CSRF protection   
    - Receive events with an HTTPS server
    - Roll endpoint secrets
    - Verify events are sent from Stripe

### 8.4. Go Live

Webhook endpoints are configured in the Dashboard’s Webhooks settings page or programmatically using webhook endpoints.

## 9. Error Handling

- Content error—Invalid content in the API request.
- Network error—Intermittent communication problems between client and server.
    - `stripe.setMaxNetworkRetries(2);`
- Server error—A problem on Stripe’s servers.
    - You should treat the result of a 500 request as indeterminate. 

A client library can’t always determine with certainty if it should retry based solely on a status code or content in the response body. The API responds with the `Stripe-Should-Retry` header when it has additional information that the request is retryable.

### 9.1. Idempotency

Idempotency is a Web API design principle defined as the ability to apply the same operation multiple times without changing the result beyond the first try. 

Idempotency keys are sent in the Idempotency-Key header, and you should use them for all POST requests to the Stripe API. Most official client libraries can send them automatically as long as they’re configured to send retries.

- Use an algorithm that generates a token with enough randomness, like UUID v4.
- Derive the key from a user-attached object like the ID of a shopping cart. This provides a relatively straightforward way to protect against double submissions.

You can identify a previously executed response that’s being replayed from the server by the header `Idempotent-Replayed: true`.