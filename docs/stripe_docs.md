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