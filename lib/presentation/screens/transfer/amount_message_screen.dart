import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:so_mobile_app/config/constants/environment.dart';

import '../../widgets/__widgets__.dart';

class AmountMessageScreen extends StatefulWidget {
  const AmountMessageScreen({super.key});

  @override
  State<AmountMessageScreen> createState() => _AmountMessageScreenState();
}

class _AmountMessageScreenState extends State<AmountMessageScreen> {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  final TextEditingController amountController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  int? userId;

  @override
  void initState() {
    super.initState();
    _getIdSendByToken();
  }

  Future<void> _saveTransfer(String dni, int id) async {
    try {
      if (userId == null) {
        return;
      }

      DateTime now = DateTime.now().toUtc();
      String formattedDatetime = '${now.toIso8601String().split('.')[0]}Z';

      final Map<String, dynamic> dataTransfer = {
        "id_send": userId,
        "id_received": id,
        "amount": double.parse(amountController.text),
        "date": formattedDatetime,
        "message_text": messageController.text,
      };

      final response = await dio.post('/transfer/create', data: dataTransfer);

      if (response.statusCode == 201) {
        _generateVoucher(dni);
      }
    } catch (e) {
      throw Error();
    }
  }

  Future<void> _getIdSendByToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      setState(() {
        userId = int.parse(decodedToken['id']);
      });
    }
  }

  void _generateVoucher(String dni) {
    Navigator.pushNamed(
      context,
      "/voucher",
      arguments: {
        'recipient': dni,
        'amount': amountController.text,
        'message': messageController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String dni = args?['dni'];
    final int id = args?['id'];

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
                  _saveTransfer(dni, id);
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
