import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:so_mobile_app/presentation/screens/home/home_screen.dart';
import 'package:so_mobile_app/presentation/screens/auth/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    // Verificar si el token existe y no está vacío
    if (token != null && token.isNotEmpty) {
      // Redirigir al HomeScreen si el usuario ha iniciado sesión
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Redirigir al LoginScreen si el usuario no ha iniciado sesión
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SigninScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Indicador de carga mientras se verifica el estado de sesión
      ),
    );
  }
}
