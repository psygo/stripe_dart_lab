import "package:http/http.dart";

Future<void> main() async {
  // 1) Payment Intent
  
  final Client client = Client();

  final Uri uri = Uri(
      scheme: "https",
      host: "api.stripe.com",
      path: "v1/payment_intents",
      userInfo:
          "sk_test_51I1ag9L9RyDuS7hQUu1yFFwUbn06tdd3prsgtv5J5ubtEFoAEqpwBsjhuwJ9OKXkAVCIGBDhUwfOCpgfTYGwXf3900GePaNepc");

  final Response response = await client.post(uri, body: <String, dynamic>{
    "amount": "1000",
    "currency": "brl",
    "payment_method_types[]": "card",
    "receipt_email": "jenny.rosen@example.com"
  });

  print(response.statusCode);
  print(response.body);
}
