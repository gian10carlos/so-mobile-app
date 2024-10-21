import 'package:flutter/material.dart';

class CustomActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const CustomActionButtonWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.lightBlue,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
