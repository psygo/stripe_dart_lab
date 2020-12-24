# Stripe

## Resources

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
[stripe_gitlab]: https://gitlab.com/exitlive/stripe-dart
[stripe_quickstart]: https://stripe.com/docs/development/quickstart
[tutorial_muhammad]: https://youtu.be/C0yptHbL2U8
[tutorial_muhammad_github]: https://github.com/AhsanAyaz/flutter_stripe_payments

### Courses

1. [Stripe in Practice][stripe_in_practice]
1. [Laravel Payment Processing][laravel_payment_processing]


[laravel_payment_processing]: https://www.udemy.com/course/laravel-payment-processing-integrating-the-best-gateways-paypal-stripe/
[stripe_in_practice]: https://www.udemy.com/course/stripe-course/

## Creating Payments with Stripe

1. Create payment method
    - Via new card or existing card
1. Create payment intent
    - Requires amount and currency
1. Confirm payment
    - Requires client secret and payment method ID.

Use Dart's `http` package to create `GET`/`POST` requests.