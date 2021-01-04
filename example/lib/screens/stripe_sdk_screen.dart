import "package:flutter/material.dart";
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
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            const Text(
              "Response",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(height: 30),
            Container(
              height: 400,
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

  String formatJson(String json) {
    return json
        .replaceAll(": {", ":\n    {")
        .replaceAll("{", "{\n    ")
        .replaceAll("}", "\n}\n")
        .replaceAll(",", ",\n  ");
  }

  Future<void> createToken() async {
    const Map<String, Object> card = {
      "number": "4242424242424242",
      "exp_month": 1,
      "exp_year": 2022,
      "cvc": 314
    };
    final Map<String, dynamic> token =
        await stripeApi.createToken({"card": card});
    setState(() {
      responseText = formatJson(token.toString());
    });
  }
}
