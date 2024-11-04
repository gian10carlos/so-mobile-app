import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:so_mobile_app/config/constants/environment.dart';

import '../../widgets/__widgets__.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  int? userId;
  String? userDni;
  List<dynamic> transfers = [];

  @override
  void initState() {
    super.initState();
    _getIdSendByToken();
  }

  Future<void> _getIdSendByToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      setState(() {
        userId = int.parse(decodedToken['id']);
        userDni = decodedToken['dni'];
      });
    }

    await _getTransfers();
  }

  Future<void> _getTransfers() async {
    try {
      final response = await dio.get('/transfer/$userId');

      if (response.statusCode == 200) {
        setState(() {
          transfers = response.data['transfers'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(name: '$userDni'),
      drawer: const CustomDrawerWidget(),
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
              child: transfers.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: transfers.length,
                      itemBuilder: (context, index) {
                        final transfer = transfers[index];
                        final bool isSender = transfer['id_send'] == userId;

                        return ListTile(
                          title: Text(
                            transfer['id_received'] == userId
                                ? 'De: Usuario ${transfer['id_send']}'
                                : 'Para: Usuario ${transfer['id_received']}',
                          ),
                          subtitle: Text(transfer['date']),
                          trailing: Text(
                            'S/. ${transfer['amount'].toStringAsFixed(2)}',
                            style: TextStyle(
                              color: isSender ? Colors.red : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottombarWidget(
        currentIndex: 0,
      ),
    );
  }
}
