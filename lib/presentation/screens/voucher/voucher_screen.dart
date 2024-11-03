import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:so_mobile_app/presentation/widgets/button_widget.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String recipient = args['recipient'];
    final String amount = args['amount'];
    final String message = args['message'];

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    String formattedTime = DateFormat('HH:mm').format(now);
    String month = DateFormat('MMMM').format(now).substring(0, 3);
    String year = DateFormat('yyyy').format(now);

    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Center(
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          recipient,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'S./$amount',
                          style: const TextStyle(
                              fontSize: 24, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$formattedDate - $formattedTime - $month - $year',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 25),
                        const Text("-------------------------"),
                        Text(
                          message,
                          style: const TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButtonWidget(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  buttonText: "Salir",
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/home", (Route<dynamic> route) => false);
                  },
                )
              ],
            ),
          )),
    );
  }
}
