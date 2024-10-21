import 'package:flutter/material.dart';

class CustomTransactionItemWidget extends StatelessWidget {
  final String name;
  final String time;
  final String amount;

  const CustomTransactionItemWidget({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.person),
          Text(name),
          Text(time),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
