import "package:flutter/material.dart";

import "screens/lib_choice_screen.dart";

void main() => runApp(const FlutterStripeDemo());

class FlutterStripeDemo extends StatelessWidget {
  const FlutterStripeDemo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LibChoiceScreen(),
    );
  }
}
