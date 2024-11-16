import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:so_mobile_app/config/constants/environment.dart';
import 'package:so_mobile_app/presentation/widgets/button_widget.dart';
import 'package:so_mobile_app/presentation/widgets/input_password_widget.dart';
import 'package:so_mobile_app/presentation/widgets/input_text_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  final TextEditingController dniController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleSignin() async {
    try {
      final response = await dio.post('/auth/login', data: {
        "dni": dniController.text,
        "password": passwordController.text,
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.08),
              const Text(
                "Iniciar Sesion",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              CustomInputTextWidget(
                hintText: "DNI",
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
              const SizedBox(height: 20),
              CustomButtonWidget(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  buttonText: "INGRESAR",
                  onPressed: () {
                    _handleSignin();
                  }),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("No tiene cuenta?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/auth/signup');
                      },
                      child: const Text(
                        "Registrar",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
