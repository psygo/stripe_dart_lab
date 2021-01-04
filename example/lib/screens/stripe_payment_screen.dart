import "package:flutter/material.dart";

import "../widgets/custom_button.dart";

class StripePaymentScreen extends StatelessWidget {
  const StripePaymentScreen();

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stripe Payment Package"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 200),
            CustomButton(
              text: "Create a Payment Intent",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
