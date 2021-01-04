import "package:flutter/material.dart";

import "stripe_payment_screen.dart";
import "stripe_sdk_screen.dart";

class LibChoiceScreen extends StatelessWidget {
  static const TextStyle buttonTextStyle = TextStyle(fontSize: 20);

  const LibChoiceScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Stripe Demo"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 200),
            RaisedButton(
              child: const Text("Stripe Payment", style: buttonTextStyle),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StripePaymentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            RaisedButton(
              child: const Text("Stripe SDK", style: buttonTextStyle),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StripeSdkScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
