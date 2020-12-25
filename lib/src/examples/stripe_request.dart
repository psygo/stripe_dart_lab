import "package:stripe/stripe.dart";

Future<void> main() async {
  final Stripe stripe = Stripe(
      "sk_test_51I1ag9L9RyDuS7hQUu1yFFwUbn06tdd3prsgtv5J5ubtEFoAEqpwBsjhuwJ9OKXkAVCIGBDhUwfOCpgfTYGwXf3900GePaNepc");

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
