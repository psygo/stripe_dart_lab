import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart";
import "package:stripe_sdk/stripe_sdk.dart";

import "../utils/environment_config.dart";
import "../widgets/custom_button.dart";

class StripeSdkScreen extends StatefulWidget {
  const StripeSdkScreen();

  @override
  _StripeSdkScreenState createState() => _StripeSdkScreenState();
}

class _StripeSdkScreenState extends State<StripeSdkScreen> {
  final StripeApi stripeApi = StripeApi(EnvironmentConfig.pk_test);
  final Client client = Client();

  String responseText = "";

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe SDK Package"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  CustomButton(
                    text: "Create a Token",
                    onPressed: createToken,
                  ),
                  CustomButton(
                    text: "Create a Payment Intent",
                    onPressed: createPaymentIntent,
                  ),
                  CustomButton(
                    text: "Complete a Payment Intent",
                    onPressed: completePaymentIntent,
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(height: 10),
            const Text(
              "Response",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(height: 30),
            Container(
              height: 300,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: <Widget>[
                  Center(
                    child: Text(
                      responseText,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatJson(Map<String, Object> json) =>
      JsonEncoder.withIndent("  ").convert(json);

  Future<void> createToken() async {
    const Map<String, Object> card = {
      "number": "4242424242424242",
      "exp_month": 1,
      "exp_year": 2022,
      "cvc": 314
    };
    final Map<String, dynamic> token =
        await stripeApi.createToken({"card": card});
    setState(() => responseText = formatJson(token));
  }

  Future<void> createPaymentIntent() async {
    final Uri uri = Uri(
      scheme: "https",
      host: "api.stripe.com",
      path: "v1/payment_intents",
      userInfo: EnvironmentConfig.sk_test,
    );
    final Response paymentIntentResponse =
        await client.post(uri, body: <String, Object>{
      "amount": "1000",
      "currency": "brl",
      "payment_method_types[]": "card",
      "receipt_email": "jenny.rosen@example.com",
    });
    setState(() => responseText = paymentIntentResponse.body);
  }

  Future<void> completePaymentIntent() async {
    // 1) Payment Method
    final Uri paymentMethodUri = Uri(
      scheme: "https",
      host: "api.stripe.com",
      path: "v1/payment_methods",
      userInfo: EnvironmentConfig.sk_test,
    );
    final Response paymentMethodResponse = await client.post(
      paymentMethodUri,
      body: <String, Object>{
        "type": "card",
        "card[number]": "4242424242424242",
        "card[exp_month]": "1",
        "card[exp_year]": "2022",
        "card[cvc]": "314",
      },
    );
    final Map<String, Object> paymentMethodResponseJson =
        json.decode(paymentMethodResponse.body);

    // 2) Payment Intent with Auto Confirmation
    final Uri paymentIntentUri = Uri(
      scheme: "https",
      host: "api.stripe.com",
      path: "v1/payment_intents",
      userInfo: EnvironmentConfig.sk_test,
    );
    // TODO: Attach the payment method ID to the payment intent belo
    final Response paymentIntentResponse =
        await client.post(paymentIntentUri, body: <String, Object>{
      "amount": "1000",
      "currency": "brl",
      "payment_method_types[]": "card",
      "receipt_email": "jenny.rosen@example.com",
      "confirm": "true",
      "payment_method": paymentMethodResponseJson["id"],
    });
    setState(() => responseText = paymentIntentResponse.body);
  }
}
