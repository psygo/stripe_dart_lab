import "package:stripe_sdk/stripe_sdk.dart";

/// I don't think this will work if you're not inside a Flutter app.
Future<void> main() async {
  // final String apiKey = Platform.environment["STRIPE_SK_TEST"];
  // StripeApi.init(apiKey);

  final Stripe stripe = Stripe.instance;

  final Map<String, dynamic> response =
      await stripe.confirmSetupIntent("", "card");

  print(response);
}
