import "package:flutter/material.dart";

import "lib_choice_screen.dart";

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
            RaisedButton(
              child: const Text(
                "Create a Payment Intent",
                style: LibChoiceScreen.buttonTextStyle,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
