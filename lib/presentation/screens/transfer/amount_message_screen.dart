import 'package:flutter/material.dart';

import '../../widgets/__widgets__.dart';

class AmountMessageScreen extends StatefulWidget {
  const AmountMessageScreen({super.key});

  @override
  State<AmountMessageScreen> createState() => _AmountMessageScreenState();
}

class _AmountMessageScreenState extends State<AmountMessageScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CustomInputTextWidget(
              hintText: "Monto",
              color: Colors.black,
              obscureText: false,
              keyboardType: TextInputType.number,
              controller: amountController,
            ),
            const SizedBox(height: 20),
            CustomInputTextWidget(
              hintText: "Mensage",
              color: Colors.black,
              obscureText: false,
              keyboardType: TextInputType.multiline,
              controller: messageController,
            ),
            const Spacer(),
            Center(
              child: CustomButtonWidget(
                backgroundColor: Colors.orange,
                buttonText: 'Depositar',
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/voucher",
                    arguments: {
                      'recipient': 'Juan Pérez',
                      'amount': amountController.text,
                      'message': messageController.text,
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottombarWidget(
        currentIndex: 0,
      ),
    );
  }
}
