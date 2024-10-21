import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String balance;
  final String profileNumber;
  const CustomCardWidget({
    super.key,
    required this.balance,
    required this.profileNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Perfil balance',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            balance,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Número de perfil: $profileNumber',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
