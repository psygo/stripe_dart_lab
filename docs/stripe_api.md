# [Stripe API][stripe_api]


[stripe_api]: https://stripe.com/docs/api?lang=curl

---

**Table of Contents**

<div id="user-content-toc">
  <ul>
    <li>
      <a href="#1-introduction">1. Introduction</a>
      <ul>
        <li><a href="#11-authentication">1.1. Authentication</a></li>
        <li><a href="#12-errors">1.2. Errors</a></li>
        <li><a href="#13-idempotent-requests">1.3. Idempotent Requests</a></li>
        <li><a href="#14-metadata">1.4. Metadata</a></li>
        <li><a href="#15-pagination">1.5. Pagination</a></li>
        <li><a href="#16-auto-pagination">1.6. Auto-Pagination</a></li>
        <li><a href="#17-request-ids">1.7. Request IDs</a></li>
      </ul>
    </li>
    <li>
      <a href="#2-core-resources">2. Core Resources</a>
      <ul>
        <li>
          <a href="#21-balance">2.1. Balance</a>
          <ul>
            <li><a href="#211-balance-object">2.1.1. Balance Object</a></li>
          </ul>
        </li>
        <li><a href="#22-charges">2.2. Charges</a></li>
        <li>
          <a href="#23-customers">2.3. Customers</a>
          <ul>
            <li>
              <a href="#231-delete-a-customer">2.3.1. Delete a Customer</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="#24-disputes">2.4. Disputes</a>
          <ul>
            <li>
              <a href="#241-updating-a-dispute">2.4.1. Updating a dispute</a>
            </li>
          </ul>
        </li>
        <li><a href="#25-events">2.5. Events</a></li>
        <li>
          <a href="#26-files">2.6. Files</a>
          <ul>
            <li><a href="#261-create-a-file">2.6.1. Create a file</a></li>
          </ul>
        </li>
        <li><a href="#27-file-links">2.7. File Links</a></li>
        <li><a href="#28-mandates">2.8. Mandates</a></li>
        <li><a href="#29-paymentintents">2.9. PaymentIntents</a></li>
        <li>
          <a href="#210-setupintents">2.10. SetupIntents</a>
          <ul>
            <li>
              <a href="#2101-confirm-a-setupintent"
                >2.10.1. Confirm a SetupIntent</a
              >
            </li>
          </ul>
        </li>
        <li><a href="#211-setupattempts">2.11. SetupAttempts</a></li>
        <li><a href="#212-payouts">2.12. Payouts</a></li>
        <li><a href="#213-products">2.13. Products</a></li>
        <li><a href="#214-prices">2.14. Prices</a></li>
        <li><a href="#215-refunds">2.15. Refunds</a></li>
        <li><a href="#216-tokens">2.16. Tokens</a></li>
      </ul>
    </li>
    <li>
      <a href="#3-payment-methods">3. Payment Methods</a>
      <ul>
        <li><a href="#31-paymentmethods">3.1. PaymentMethods</a></li>
        <li>
          <a href="#32-bank-accounts">3.2. Bank Accounts</a>
          <ul>
            <li>
              <a href="#321-verify-a-bank-account"
                >3.2.1. Verify a bank account</a
              >
            </li>
          </ul>
        </li>
        <li><a href="#33-">3.3. .</a></li>
        <li><a href="#34-sources">3.4. Sources</a></li>
      </ul>
    </li>
    <li>
      <a href="#4-checkout">4. Checkout</a>
      <ul>
        <li>
          <a href="#41-sessions">4.1. Sessions</a>
          <ul>
            <li>
              <a href="#411-retrieve-a-checkout-sessions-line-items"
                >4.1.1. Retrieve a Checkout Session&#39;s line items</a
              >
            </li>
          </ul>
        </li>
      </ul>
    </li>
    <li>
      <a href="#5-billing">5. Billing</a>
      <ul>
        <li><a href="#51-coupons">5.1. Coupons</a></li>
        <li>
          <a href="#52-customer-balance-transaction"
            >5.2. Customer Balance Transaction</a
          >
        </li>
        <li><a href="#53-customer-portal">5.3. Customer Portal</a></li>
        <li><a href="#54-customer-tax-ids">5.4. Customer Tax IDs</a></li>
        <li><a href="#55-discounts">5.5. Discounts</a></li>
        <li>
          <a href="#56-invoices">5.6. Invoices</a>
          <ul>
            <li>
              <a href="#561-create-an-invoice">5.6.1. Create an invoice</a>
            </li>
            <li>
              <a href="#562-update-an-invoice">5.6.2. Update an invoice</a>
            </li>
            <li><a href="#563-pay-an-invoice">5.6.3. Pay an invoice</a></li>
            <li>
              <a href="#564-retrieve-an-upcoming-invoice"
                >5.6.4. Retrieve an upcoming invoice</a
              >
            </li>
          </ul>
        </li>
        <li><a href="#57-invoice-items">5.7. Invoice Items</a></li>
        <li><a href="#58-plans">5.8. Plans</a></li>
        <li><a href="#59-promotion-code">5.9. Promotion Code</a></li>
        <li><a href="#510-subscriptions">5.10. Subscriptions</a></li>
        <li>
          <a href="#511-subscription-schedules">5.11. Subscription Schedules</a>
        </li>
        <li><a href="#512-tax-rate">5.12. Tax Rate</a></li>
        <li><a href="#513-usage-records">5.13. Usage Records</a></li>
      </ul>
    </li>
    <li>
      <a href="#6-connect">6. Connect</a>
      <ul>
        <li><a href="#61-accounts">6.1. Accounts</a></li>
        <li><a href="#62-account-links">6.2. Account Links</a></li>
        <li><a href="#63-application-fees">6.3. Application Fees</a></li>
        <li><a href="#64-capabilities">6.4. Capabilities</a></li>
        <li><a href="#65-country-specs">6.5. Country Specs</a></li>
        <li><a href="#66-external-accounts">6.6. External Accounts</a></li>
        <li><a href="#67-person">6.7. Person</a></li>
        <li><a href="#68-top-ups">6.8. Top-ups</a></li>
        <li><a href="#69-transfers">6.9. Transfers</a></li>
        <li><a href="#610-transfer-reversals">6.10. Transfer Reversals</a></li>
      </ul>
    </li>
    <li>
      <a href="#7-fraud">7. Fraud</a>
      <ul>
        <li><a href="#71-early-fraud-warning">7.1. Early Fraud Warning</a></li>
        <li><a href="#72-reviews">7.2. Reviews</a></li>
        <li><a href="#73-value-lists">7.3. Value Lists</a></li>
      </ul>
    </li>
    <li>
      <a href="#8-issuing">8. Issuing</a>
      <ul>
        <li><a href="#81-authorizations">8.1. Authorizations</a></li>
        <li><a href="#82-cardholders">8.2. Cardholders</a></li>
        <li><a href="#83-disputes">8.3. Disputes</a></li>
      </ul>
    </li>
    <li>
      <a href="#9-terminal">9. Terminal</a>
      <ul>
        <li><a href="#91-connection-token">9.1. Connection Token</a></li>
        <li><a href="#92-location">9.2. Location</a></li>
        <li><a href="#93-reader">9.3. Reader</a></li>
      </ul>
    </li>
    <li>
      <a href="#10-orders">10. Orders</a>
      <ul>
        <li><a href="#101-orders">10.1. Orders</a></li>
        <li><a href="#102-skus">10.2. SKUs</a></li>
      </ul>
    </li>
    <li>
      <a href="#11-sigma">11. Sigma</a>
      <ul>
        <li><a href="#111-scheduled-queries">11.1. Scheduled Queries</a></li>
      </ul>
    </li>
    <li>
      <a href="#12-reporting">12. Reporting</a>
      <ul>
        <li><a href="#121-report-runs">12.1. Report Runs</a></li>
      </ul>
    </li>
    <li>
      <a href="#13-webhook-endpoints">13. Webhook Endpoints</a>
      <ul>
        <li>
          <a href="#131-create-a-webhook-endpoint"
            >13.1. Create a webhook endpoint</a
          >
        </li>
      </ul>
    </li>
  </ul>
</div>

---

## 1. Introduction

### 1.1. Authentication

You can also set a per-request key with an option. This is often useful for Connect applications that use multiple API keys during the lifetime of a process. Methods on the returned object reuse the same API key.

All API requests must be made over HTTPS. Calls made over plain HTTP will fail. API requests without authentication will also fail.

### 1.2. Errors

In the error page, you will find all of the respective attributes of an error message.

### 1.3. Idempotent Requests

The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. This is useful when an API call is disrupted in transit and you do not receive a response. For example, if a request to create a charge does not respond due to a network connection error, you can retry the request with the same idempotency key to guarantee that no more than one charge is created.

An idempotency key is a unique value generated by the client which the server uses to recognize subsequent retries of the same request. How you create unique keys is up to you, but we suggest using V4 UUIDs, or another random string with enough entropy to avoid collisions.

### 1.4. Metadata

Updateable Stripe objects—including Account, Charge, Customer, PaymentIntent, Refund, Subscription, and Transfer—have a metadata parameter. You can use this parameter to attach key-value data to these Stripe objects.

You can specify up to 50 keys, with key names up to 40 characters long and values up to 500 characters long.

> Updating these data both in Firebase and Stripe might be a good idea, but it would also be easy to forget. But we could use OOP to ensure that both updates occur via an interface for both updates.

Unlike metadata, description is a single string, and your users may see it (e.g., in email receipts Stripe sends on your behalf).

Sample metadata use cases:

- Link IDs
- Refund papertrails
- Customer details

### 1.5. Pagination

All top-level API resources have support for bulk fetches via "list" API methods. For instance, you can list charges, list customers, and list invoices. These list API methods share a common structure, taking at least these three parameters: limit, `starting_after`, and `ending_before`.

List Response Format:

- `object`
- `data`
- `has_more`
- `url`

### 1.6. Auto-Pagination

Most of our libraries support auto-pagination. This feature easily handles fetching large lists of resources without having to manually paginate results and perform subsequent requests.

Since curl simply emits raw HTTP requests, it doesn't support auto-pagination.

### 1.7. Request IDs

Each API request has an associated request identifier. You can find this value in the response headers, under Request-Id. You can also find request identifiers in the URLs of individual request logs in your Dashboard. 

## 2. Core Resources

### 2.1. Balance

This is an object representing your Stripe balance. You can retrieve it to see the balance currently on your Stripe account.

#### 2.1.1. Balance Object

Funds that are available to be transferred or paid out, whether automatically by Stripe or explicitly via the Transfers API or Payouts API.

### 2.2. Charges

To charge a credit or a debit card, you create a Charge object. You can retrieve and refund individual charges as well as list all charges. Charges are identified by a unique, random ID.

Related guide: [Accept a payment with the Charges API][charges_tutorial].

Amount intended to be collected by this payment. A positive integer representing how much to charge in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or equivalent in charge currency. The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).

You can:

- Create a charge
- Retrieve a charge
- Update a charge
- List all charges


[charges_tutorial]: https://stripe.com/docs/payments/accept-a-payment-charges

### 2.3. Customers

Customer objects allow you to perform recurring charges, and to track multiple charges, that are associated with the same customer. The API allows you to create, delete, and update your customers. You can retrieve individual customers as well as a list of all your customers.

Related guide: [Save a card during payment][save_card_tutorial] &mdash; tutorial on how payment intents fit into payments.


[save_card_tutorial]: https://stripe.com/docs/payments/save-during-payment

#### 2.3.1. Delete a Customer

Permanently deletes a customer. It cannot be undone. Also immediately cancels any active subscriptions on the customer.

### 2.4. Disputes

A dispute occurs when a customer questions your charge with their card issuer. When this happens, you're given the opportunity to respond to the dispute with evidence that shows that the charge is legitimate. You can find more information about the dispute process in our Disputes and Fraud documentation.

#### 2.4.1. Updating a dispute

When you get a dispute, contacting your customer is always the best first step. If that doesn’t work, you can submit evidence to help us resolve the dispute in your favor. You can do this in your dashboard, but if you prefer, you can use the API to submit evidence programmatically

### 2.5. Events

Events are our way of letting you know when something interesting happens in your account.

As with other API resources, you can use endpoints to retrieve an individual event or a list of events from the API. We also have a separate webhooks system for sending the Event objects directly to an endpoint on your server. Webhooks are managed in your account settings, and our Using Webhooks guide will help you get set up.

All of POST, GET, PUT operations on data can be triggered by this part of the API.

### 2.6. Files

This is an object representing a file hosted on Stripe's servers. The file may have been uploaded by yourself using the create file request (for example, when uploading dispute evidence) or it may have been created by Stripe (for example, the results of a Sigma scheduled query).

#### 2.6.1. Create a file

To upload a file to Stripe, you’ll need to send a request of type multipart/form-data. The request should contain the file you would like to upload, as well as the parameters for creating a file.
All of Stripe’s officially supported Client libraries should have support for sending multipart/form-data.

### 2.7. File Links

To share the contents of a File object with non-Stripe users, you can create a FileLink. FileLinks contain a URL that can be used to retrieve the contents of the file without authentication.

### 2.8. Mandates

A Mandate is a record of the permission a customer has given you to debit their payment method.

### 2.9. PaymentIntents

A PaymentIntent guides you through the process of collecting a payment from your customer. We recommend that you create exactly one PaymentIntent for each order or customer session in your system. You can reference the PaymentIntent later to see the history of payment attempts for a particular session.

A PaymentIntent transitions through multiple statuses throughout its lifetime as it interfaces with Stripe.js to perform authentication flows and ultimately creates at most one successful charge.

`amount`: Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the smallest currency unit (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or equivalent in charge currency. The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).

Related guide: [Payment Intents API][payment_intent_tutorial].

*Confirm* that your customer intends to pay with current or provided payment method. Upon confirmation, the PaymentIntent will attempt to initiate a payment.

`POST v1/payment_intents/:id/confirm`

`setup_future_usage`: Indicates that you intend to make future payments with this PaymentIntent’s payment method.

Capture the funds of an existing uncaptured PaymentIntent when its status is `requires_capture`.

Uncaptured PaymentIntents will be canceled exactly seven days after they are created.


[payment_intent_tutorial]: https://stripe.com/docs/api/payment_intents

### 2.10. SetupIntents

A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments. For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment. Later, you can use PaymentIntents to drive the payment flow.

> By using SetupIntents, you ensure that your customers experience the minimum set of required friction, even as regulations change over time.

#### 2.10.1. Confirm a SetupIntent

Confirm that your customer intends to set up the current or provided payment method. For example, you would confirm a SetupIntent when a customer hits the “Save” button on a payment method management page on your website.

### 2.11. SetupAttempts

A SetupAttempt describes one attempted confirmation of a SetupIntent, whether that confirmation was successful or unsuccessful. You can use SetupAttempts to inspect details of a specific attempt at setting up a payment method using a SetupIntent.

### 2.12. Payouts

A Payout object is created when you receive funds from Stripe, or when you initiate a payout to either a bank account or debit card of a connected Stripe account. You can retrieve individual payouts, as well as list all payouts. Payouts are made on varying schedules, depending on your country and industry.

To send funds to your own bank account, you create a new payout object. Your Stripe balance must be able to cover the payout amount, or you’ll receive an “Insufficient Funds” error.

If your API key is in test mode, money won’t actually be sent, though everything else will occur as if in live mode.

Payouts can fail for a variety of reasons. The reason a given payout failed is available in a Payout object's failure_code attribute.

### 2.13. Products

Products describe the specific goods or services you offer to your customers. For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product. They can be used in conjunction with Prices to configure pricing in Checkout and Subscriptions.

### 2.14. Prices

Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products. Products help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.

For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.

```json
{
    ...
    "product": "product_key",
    ...
}
```

### 2.15. Refunds

Refund objects allow you to refund a charge that has previously been created but not yet refunded. Funds will be refunded to the credit or debit card that was originally charged.

You can optionally refund only part of a charge. You can do so multiple times, until the entire charge has been refunded.

### 2.16. Tokens

Tokenization is the process Stripe uses to collect sensitive card or bank account details, or personally identifiable information (PII), directly from your customers in a secure manner. A token representing this information is returned to your server to use. You should use our recommended payments integrations to perform this process client-side. This ensures that no sensitive card data touches your server, and allows your integration to operate in a PCI-compliant way.

Tokens cannot be stored or used more than once. To store card or bank account information for later use, you can create Customer objects or Custom accounts. Note that Radar, our integrated solution for automatic fraud protection, supports only integrations that use client-side tokenization.

Types of tokens:

- Card
- Bank account
- PII
- Account
- Person
- CVC

## 3. Payment Methods

### 3.1. PaymentMethods

PaymentMethod objects represent your customer's payment instruments. They can be used with PaymentIntents to collect payments or saved to Customer objects to store instrument details for future payments.

Related guides: Payment Methods and More Payment Scenarios.

See the `type` parameter for accepted payment types.

To attach a new PaymentMethod to a customer for future payments, we recommend you use a SetupIntent or a PaymentIntent with setup_future_usage. These approaches will perform any necessary steps to ensure that the PaymentMethod can be used in a future payment. Using the `/v1/payment_methods/:id/attach` endpoint does not ensure that future payments can be made with the attached PaymentMethod. See Optimizing cards for future payments for more information about setting up future payments.

### 3.2. Bank Accounts

These bank accounts are payment methods on Customer objects.

On the other hand External Accounts are transfer destinations on Account objects for Custom accounts. They can be bank accounts or debit cards as well, and are documented in the links above.

When you create a new bank account, you must specify a Customer object on which to create it.

#### 3.2.1. Verify a bank account

A customer's bank account must first be verified before it can be charged. Stripe supports instant verification using Plaid for many of the most popular banks. If your customer's bank is not supported or you do not wish to integrate with Plaid, you must manually verify the customer's bank account using the API.

### 3.3. .

You can store multiple cards on a customer in order to charge the customer later. You can also store multiple debit cards on a recipient in order to transfer to those cards later.

`/v1/customers/:id/sources?object=card`

If the card’s owner has no default card, then the new card will become the default. However, if the owner already has a default, then it will not change. To change the default, you should update the customer to have a new default_source.

### 3.4. Sources

Source objects allow you to accept a variety of payment methods. They represent a customer's payment instrument, and can be used with the Stripe API just like a Card object: once chargeable, they can be charged, or can be attached to customers.

## 4. Checkout

### 4.1. Sessions

A Checkout Session represents your customer's session as they pay for one-time purchases or subscriptions through Checkout. We recommend creating a new Session each time your customer attempts to pay.

Once payment is successful, the Checkout Session will contain a reference to the Customer, and either the successful PaymentIntent or an active Subscription.

You can create a Checkout Session on your server and pass its ID to the client to begin Checkout.

#### 4.1.1. Retrieve a Checkout Session's line items

When retrieving a Checkout Session, there is an includable line_items property containing the first handful of those items. There is also a URL where you can retrieve the full (paginated) list of line items.

## 5. Billing

### 5.1. Coupons

A coupon contains information about a percent-off or amount-off discount you might want to apply to a customer. Coupons may be applied to invoices or orders. Coupons do not work with conventional one-off charges.

You can create coupons easily via the coupon management page of the Stripe dashboard. Coupon creation is also accessible via the API if you need to create coupons on the fly.

### 5.2. Customer Balance Transaction

Each customer has a balance value, which denotes a debit or credit that's automatically applied to their next invoice upon finalization. You may modify the value directly by using the update customer API, or by creating a Customer Balance Transaction, which increments or decrements the customer's balance by the specified amount.

Most credit balance transaction fields are immutable, but you may update its `description` and `metadata`.

### 5.3. Customer Portal

A session describes the instantiation of the customer portal for a particular customer. By visiting the session's URL, the customer can manage their subscriptions and billing details. For security reasons, sessions are short-lived and will expire if the customer does not visit the URL. Create sessions on-demand when customers intend to manage their subscriptions and billing details.

### 5.4. Customer Tax IDs

You can add one or multiple tax IDs to a customer. A customer's tax IDs are displayed on invoices and credit notes issued for the customer.

### 5.5. Discounts

A discount represents the actual application of a coupon to a particular customer. It contains information about when the discount began and when it will end.

### 5.6. Invoices

Invoices are statements of amounts owed by a customer, and are either generated one-off, or generated periodically from a subscription.

They contain invoice items, and proration adjustments that may be caused by subscription upgrades/downgrades (if necessary).

#### 5.6.1. Create an invoice

This endpoint creates a draft invoice for a given customer. The draft invoice created pulls in all pending invoice items on that customer, including prorations. The invoice remains a draft until you finalize the invoice, which allows you to pay or send the invoice to your customers.

#### 5.6.2. Update an invoice

Draft invoices are fully editable. Once an invoice is finalized, monetary values, as well as collection_method, become uneditable.

If you would like to stop the Stripe Billing engine from automatically finalizing, reattempting payments on, sending reminders for, or automatically reconciling invoices, pass auto_advance=false.

#### 5.6.3. Pay an invoice

Stripe automatically creates and then attempts to collect payment on invoices for customers on subscriptions according to your subscriptions settings. However, if you’d like to attempt payment on an invoice out of the normal collection schedule or for some other reason, you can do so.

#### 5.6.4. Retrieve an upcoming invoice

At any time, you can preview the upcoming invoice for a customer. This will show you all the charges that are pending, including subscription renewal charges, invoice item charges, etc. It will also show you any discounts that are applicable to the invoice.

### 5.7. Invoice Items

Sometimes you want to add a charge or credit to a customer, but actually charge or credit the customer's card only at the end of a regular billing cycle. This is useful for combining several charges (to minimize per-transaction fees), or for having Stripe tabulate your usage-based billing totals.

### 5.8. Plans

You can now model subscriptions more flexibly using the Prices API. It replaces the Plans API and is backwards compatible to simplify your migration.

Plans define the base price, currency, and billing cycle for recurring purchases of products. Products help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.

### 5.9. Promotion Code

A Promotion Code represents a customer-redeemable code for a coupon. It can be used to create multiple codes for a single coupon.

### 5.10. Subscriptions

Subscriptions allow you to charge a customer on a recurring basis.

### 5.11. Subscription Schedules

Creates a new subscription schedule object. Each customer can have up to 500 active or scheduled subscriptions.

### 5.12. Tax Rate

Tax rates can be applied to invoices, subscriptions and Checkout Sessions to collect tax.

### 5.13. Usage Records

Usage records allow you to report customer usage and metrics to Stripe for metered billing of subscription prices.

Related guide: Metered Billing.

The default calculation for usage is to add up all the quantity values of the usage records within a billing period. You can change this default behavior with the billing plan’s aggregate_usage parameter. When there is more than one usage record with the same timestamp, Stripe adds the quantity values together. In most cases, this is the desired resolution, however, you can change this behavior with the action parameter.

## 6. Connect

Connect is a powerful API and set of tools used to route payments between a business, customers, and recipients who need to get paid. It powers payments for business models like *marketplaces* and *software platforms*. Connect can be used on its own to send payouts to recipients, or alongside Stripe Payments to accept and route payments from customers.

> Me: You're basically going to act as Stripe for your customers, charging a fee for each transaction if you wish for example.

### 6.1. Accounts

This is an object representing a Stripe account. You can retrieve it to see properties on the account like its current e-mail address or if the account is enabled yet to make live charges.

Some properties, marked below, are available only to platforms that want to create and manage Express or Custom accounts.

### 6.2. Account Links

Account Links are the means by which a Connect platform grants a connected account permission to access Stripe-hosted applications, such as Connect Onboarding.

### 6.3. Application Fees

When you collect a transaction fee on top of a charge made for your user (using Connect), an Application Fee object is created in your account. You can list, retrieve, and refund application fees.

### 6.4. Capabilities

This is an object representing a capability for a Stripe account.

### 6.5. Country Specs

Stripe needs to collect certain pieces of information about each account created. These requirements can differ depending on the account's country. The Country Specs API makes these rules available to your integration.

### 6.6. External Accounts

External Accounts are transfer destinations on Account objects for Custom and Express accounts. They can be bank accounts or debit cards.

Bank accounts and debit cards can also be used as payment sources on regular charges, and are documented in the links above.

### 6.7. Person

This is an object representing a person associated with a Stripe account.

### 6.8. Top-ups

To top up your Stripe balance, you create a top-up object. You can retrieve individual top-ups, as well as list all top-ups. Top-ups are identified by a unique, random ID.

### 6.9. Transfers

A Transfer object is created when you move funds between Stripe accounts as part of Connect.

### 6.10. Transfer Reversals

Stripe Connect platforms can reverse transfers made to a connected account, either entirely or partially, and can also specify whether to refund any related application fees. Transfer reversals add to the platform's balance and subtract from the destination account's balance.

Reversing a transfer that was made for a destination charge is allowed only up to the amount of the charge. It is possible to reverse a transfer_group transfer only if the destination account has enough balance to cover the reversal.

## 7. Fraud

### 7.1. Early Fraud Warning

An early fraud warning indicates that the card issuer has notified us that a charge may be fraudulent.

### 7.2. Reviews

Reviews can be used to supplement automated fraud detection with human expertise.

### 7.3. Value Lists

Value lists allow you to group values together which can then be referenced in rules.

## 8. Issuing

### 8.1. Authorizations

When an issued card is used to make a purchase, an Issuing Authorization object is created. Authorizations must be approved for the purchase to be completed successfully.

> Stripe Issuing is an API for businesses to instantly create, manage, and distribute payment cards.

### 8.2. Cardholders

An Issuing Cardholder object represents an individual or business entity who is issued cards.

### 8.3. Disputes

As a card issuer, you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.

## 9. Terminal

### 9.1. Connection Token

A Connection Token is used by the Stripe Terminal SDK to connect to a reader.

### 9.2. Location

A Location represents a grouping of readers.

### 9.3. Reader

A Reader represents a physical device for accepting payment details.

## 10. Orders

### 10.1. Orders

Order objects are created to handle end customers' purchases of previously defined products. You can create, retrieve, and pay individual orders, as well as list all orders. Orders are identified by a unique, random ID.

### 10.2. SKUs

Stores representations of stock keeping units. SKUs describe specific product variations, taking into account any combination of: attributes, currency, and cost. For example, a product may be a T-shirt, whereas a specific SKU represents the `size: large, color: red` version of that shirt.

## 11. Sigma

### 11.1. Scheduled Queries

If you have scheduled a Sigma query, you'll receive a sigma.scheduled_query_run.created webhook each time the query runs. The webhook contains a ScheduledQueryRun object, which you can use to retrieve the query results.

## 12. Reporting

### 12.1. Report Runs

The Report Run object represents an instance of a report type generated with specific run parameters. Once the object is created, Stripe begins processing the report. When the report has finished running, it will give you a reference to a file where you can retrieve your results. For an overview, see API Access to Reports.

## 13. Webhook Endpoints

You can configure webhook endpoints via the API to be notified about events that happen in your Stripe account or connected accounts.

Most users configure webhooks from the dashboard, which provides a user interface for registering and testing your webhook endpoints.

### 13.1. Create a webhook endpoint

A webhook endpoint must have a url and a list of enabled_events. You may optionally specify the Boolean connect parameter. If set to true, then a Connect webhook endpoint that notifies the specified url about events from all connected accounts is created; otherwise an account webhook endpoint that notifies the specified url only about events from your account is created. You can also create webhook endpoints in the webhooks settings section of the Dashboard.