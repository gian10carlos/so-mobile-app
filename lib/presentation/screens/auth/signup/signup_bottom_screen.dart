import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/__config__.dart';
import '../../../widgets/__widgets__.dart';

class SignupBottomScreen extends StatefulWidget {
  const SignupBottomScreen({super.key});

  @override
  State<SignupBottomScreen> createState() => _SignupBottomScreenState();
}

class _SignupBottomScreenState extends State<SignupBottomScreen> {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  final TextEditingController dniController = TextEditingController();
  final TextEditingController codeIdentityController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();
  final TextEditingController codeKeyController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleSignin() async {
    try {
      final response = await dio.post('/auth/register', data: {
        "dni": dniController.text,
        "code_identity": codeIdentityController.text,
        "card_number": cardNumberController.text,
        "ccv": ccvController.text,
        "code_key": codeKeyController.text,
        "password": passwordController.text,
        "status": true,
      });

      if (response.statusCode == 201) {
        _setTokenSession(response.data["token"]);
      } else {
        _showErrorSnackBar(
            "Inicio de sesión fallido. Verifica tus credenciales.");
      }
    } catch (e) {
      _showErrorSnackBar("Error: ${e.toString()}");
    }
  }

  void _showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _setTokenSession(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    _navigationPage();
  }

  void _navigationPage() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomInputTextWidget(
          hintText: "DNI",
          color: Colors.black,
          obscureText: false,
          keyboardType: TextInputType.number,
          controller: dniController,
        ),
        const SizedBox(height: 15),
        CustomInputTextWidget(
          hintText: "Codigo identificador",
          color: Colors.black,
          obscureText: false,
          keyboardType: TextInputType.number,
          controller: dniController,
        ),
        const SizedBox(height: 15),
        CustomInputTextWidget(
          hintText: "Numero tarjeta",
          color: Colors.black,
          obscureText: false,
          keyboardType: TextInputType.number,
          controller: dniController,
        ),
        const SizedBox(height: 15),
        CustomInputTextWidget(
          hintText: "CCV",
          color: Colors.black,
          obscureText: false,
          keyboardType: TextInputType.number,
          controller: dniController,
        ),
        const SizedBox(height: 15),
        CustomInputTextWidget(
          hintText: "Clave cajero",
          color: Colors.black,
          obscureText: false,
          keyboardType: TextInputType.number,
          controller: dniController,
        ),
        const SizedBox(height: 15),
        CustomInputPasswordWidget(
          color: Colors.black,
          hintText: "Contraseña",
          controller: passwordController,
        ),
        const SizedBox(height: 15),
        CustomInputPasswordWidget(
          color: Colors.black,
          hintText: "Confirmar contraseña",
          controller: passwordController,
        ),
        const SizedBox(height: 20),
        CustomButtonWidget(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            buttonText: "REGISTRAR",
            onPressed: () {
              _handleSignin();
            }),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text("Tienes cuenta?"),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/auth/signin');
                },
                child: const Text(
                  "Iniciar Sesion",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        )
      ],
    );
  }
}
