# Stripe Dart Lab

> Personally, I feel like the best way of getting acquainted with Stripe is through reading the raw [Stripe API Docs][stripe_api]. You will find all of the data entities there, and how to get them, which is exactly what the SDKs do anyway, albeit in a more friendly fashion &mdash; or is the raw fashion more friendly?

This is supposed to be a repository for experimenting with the [Stripe API][stripe_hq] in the context of Dart and Flutter.

There are currently 3 main approaches/packages for using the Stripe API in Dart:

1. Pure REST HTTP requests with JSON.
    - Uses either the [`dart:io`][dart_io] or the [`http`][http_dart] packages.
1. The [`stripe_payment`][stripe_payment] package.
1. The [`Stripe`][stripe_dart] Dart package, by Matias Meno and Martin Flucka.
    - From their docs: *This implementation is based on the official Stripe Java and NodeJS API wrappers and written as a proper native dart library.*
1. The [`Stripe SDK`][stripe_sdk_dart] package, by Lars Dahl.
    - Specifically for Flutter.
    - Has a bunch of useful widgets.

> **Stripe offers a [checklist][checklist] page where you can see the recommended best practices.**


[checklist]: https://stripe.com/docs/development/checklist
[dart_io]: https://api.dart.dev/stable/2.10.4/dart-io/dart-io-library.html
[http_dart]: https://pub.dev/packages/http
[stripe_dart]: https://pub.dev/packages/stripe
[stripe_hq]: https://github.com/stripe
[stripe_payment]: https://pub.dev/packages/stripe_payment
[stripe_sdk_dart]: https://pub.dev/packages/stripe_sdk

---

**Table of Contents**

<div id="user-content-toc">
  <ul>
    <li><a href="#1-pros-and-cons-of-each-approach">1. Pros and Cons of Each Approach</a></li>
    <li><a href="#2-creating-payments-with-stripe">2. Creating Payments with Stripe</a></li>
    <li><a href="#3-setting-up-environment-variables">3. Setting Up Environment Variables</a></li>
    <li><a href="#4-resources">4. Resources</a> 
      <ul>
        <li><a href="#41-courses">4.1. Courses</a></li>
      </ul>
    </li>
  </ul>
</div>

---

## 1. Pros and Cons of Each Approach

| Approach                                   | Pros                                                              | Cons                             |
| ------------------------------------------ | ----------------------------------------------------------------- | -------------------------------- |
| REST/HTTP/JSON                             | Highest amount of flexibility, fewer dependencies                 | Way more work, at least at first |
| [`Stripe` by Meno and Flucka][stripe_dart] | Very basic and yet comprehensive implementation of the Stripe API | Less flexibility                 |
| [`Stripe SDK` by Dahl][stripe_sdk_dart]    | Tons of useful functionalities and Flutter widgets                | Probably won't use most of it    |

## 2. Creating Payments with Stripe

1. Create payment method
    - Via new card or existing card
1. Create payment intent
    - Requires amount and currency
1. Confirm payment
    - Requires client secret and payment method ID.

Use Dart's `http` package to create `GET`/`POST` requests.

## 3. Setting Up Environment Variables

For security reasons, using environment variables is much safer than exposing them in the code.

> If you make a mistake and accidentally expose a key in your code, Stripe allows you to roll over your current key and get a new one. Note, however, that hooks will work even after a key is dead.

On Windows, through opening Command Prompt as an admin, you can set an environment variable with something like:

```cmd
setx variable=value
```

To check if your environment key was correctly set, use `echo %variable%`.

> If you're using VS Code Integrated Terminals, this all might not work. They don't seem to have the correct or expected access to the system scope in this case. This all doesn't seem to work with PowerShell either.

Environment variables on Windows are case-sensitive.

You can also delete environment variables with an empty assignment

```cmd
setx variable=
```

## 4. Resources

1. [Stripe Developers' YouTube Channel][stripe_developers]
1. [Tutorials by Muhammad Ahsan Ayaz][tutorial_muhammad]
    - The [repo][tutorial_muhammad_github]
1. [Google Pay for Transit | System Architecture][google_pay]
1. [How to architect Online Payment Processing System for an online store?][how_to_architect_online_payment_medium]
1. [A Role-based Architecture for Processing Payment Requests][role_based_architecture]
1. [Stripe API Reference][stripe_api]
1. [Stripe Quickstart][stripe_quickstart]
1. [Fireship's Stripe Payments Basics][fireship_basics]
1. [Fireship's Stripe in 100s][fireship_100]
1. [Fireship's Stripe Payment Intents Tutorial][fireship_tutorial]
1. [Pub's Stripe SDK][pub_stripe_sdk]
1. [Pub's Stripe][pub_stripe]
    - [The package on Gitlab][stripe_gitlab]


[fireship_100]: https://www.youtube.com/watch?v=7edR32QVp_A
[fireship_basics]: https://www.youtube.com/watch?v=1XKRxeo9414&feature=youtu.be
[fireship_tutorial]: https://fireship.io/lessons/stripe-payment-intents-tutorial/
[google_pay]: https://developers.google.com/pay/transit/guides/system-architecture
[how_to_architect_online_payment_medium]: https://medium.com/get-ally/how-to-architect-online-payment-processing-system-for-an-online-store-6dc84350a39
[pub_stripe]: https://pub.dev/packages/stripe
[pub_stripe_sdk]: https://pub.dev/packages/stripe_sdk
[role_based_architecture]: https://w3c.github.io/webpayments/proposals/architecture/
[stripe_api]: https://stripe.com/docs/api
[stripe_developers]: https://www.youtube.com/channel/UCd1HAa7hlN5SCQjgCcGnsxw
[stripe_gitlab]: https://gitlab.com/exitlive/stripe-dart
[stripe_quickstart]: https://stripe.com/docs/development/quickstart
[tutorial_muhammad]: https://youtu.be/C0yptHbL2U8
[tutorial_muhammad_github]: https://github.com/AhsanAyaz/flutter_stripe_payments

### 4.1. Courses

1. [Stripe in Practice][stripe_in_practice]
1. [Laravel Payment Processing][laravel_payment_processing]


[laravel_payment_processing]: https://www.udemy.com/course/laravel-payment-processing-integrating-the-best-gateways-paypal-stripe/
[stripe_in_practice]: https://www.udemy.com/course/stripe-course/
