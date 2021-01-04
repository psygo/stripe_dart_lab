import "package:flutter/material.dart";

import "package:stripe_dart_lab_example/screens/lib_choice_screen.dart";

class StripeSdkScreen extends StatelessWidget {
  const StripeSdkScreen();

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
