import "dart:io";

import "package:stripe/stripe.dart";

Future<void> main() async {
  // 1) Payment Intent
  
  final String apiKey = Platform.environment["STRIPE_SK_TEST"];

  final Stripe stripe = Stripe(apiKey);

  final Map<String, dynamic> response = await stripe.client.post([
    "payment_intents"
  ], data: <String, dynamic>{
    "amount": "1000",
    "currency": "brl",
    "payment_method_types[]": "card",
    "receipt_email": "jenny.rosen@example.com"
  });

  print(response);
}
