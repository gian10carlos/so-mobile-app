import 'package:flutter/material.dart';

import '../../widgets/__widgets__.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(name: "Gian Carlos"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Dinero enviado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Card de destinatario
            // const CustomRecipientCard(
            //   name: 'Alan Brito',
            //   accountNumber: '0126478172',
            //   bankName: 'GT BANK',
            // ),
            const SizedBox(height: 20),
            // Monto enviado
            const Text(
              'S/. 20,000',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Balance: S/. 40,430',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),
            // Botón de procesar
            Center(
              child: CustomButtonWidget(
                backgroundColor: Colors.orange,
                buttonText: 'Procesar',
                foregroundColor: Colors.white,
                onPressed: () {
                  // Manejo de la acción al presionar "Procesar"
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottombarWidget(
      //   currentIndex: 0,
      //   onTap: _onTabTapped,
      // ),
    );
  }
}
