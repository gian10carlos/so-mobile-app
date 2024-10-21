import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButtonWidget(
      {super.key,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        minimumSize: const Size(200, 50),
      ),
      child: Text(buttonText),
    );
  }
}
