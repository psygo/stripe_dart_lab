import "package:flutter/material.dart";

import "../widgets/custom_button.dart";
import "stripe_payment_screen.dart";
import "stripe_sdk_screen.dart";

class LibChoiceScreen extends StatelessWidget {
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
            CustomButton(
              text: "Stripe Payment",
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StripePaymentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Stripe SDK",
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
