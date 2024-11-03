import 'package:flutter/material.dart';

import '../../widgets/__widgets__.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomInputTextWidget(
              hintText: "DNI",
              color: Colors.black,
              obscureText: false,
              keyboardType: TextInputType.number,
              controller: passwordController,
            ),
            const Spacer(),
            Center(
              child: CustomButtonWidget(
                backgroundColor: Colors.orange,
                buttonText: 'Procesar',
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, "/amountmessage");
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
