import 'package:flutter/material.dart';
import 'package:so_mobile_app/presentation/widgets/transaction_item_widget.dart';

import '../../widgets/__widgets__.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onTabTapped(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(name: "Gian Carlos"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CustomCardWidget(
              balance: 'S/. 2580,440.30',
              profileNumber: '1100326447',
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomActionButtonWidget(
                    icon: Icons.arrow_upward, label: 'Transferir'),
                CustomActionButtonWidget(icon: Icons.add, label: 'Subir'),
                CustomActionButtonWidget(
                    icon: Icons.attach_money, label: 'Pagar'),
                CustomActionButtonWidget(
                    icon: Icons.shopping_cart, label: 'Comprar'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Transacciones recientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  CustomTransactionItemWidget(
                      name: 'Alan Brito', time: '10:30pm', amount: 'S/. 30,40'),
                  CustomTransactionItemWidget(
                      name: 'Mario Neta', time: '10:30pm', amount: 'S/. 1,00'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottombarWidget(
        currentIndex: 0,
        onTap: _onTabTapped,
      ),
    );
  }
}
