import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(_) {
    return RaisedButton(
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
    );
  }
}
