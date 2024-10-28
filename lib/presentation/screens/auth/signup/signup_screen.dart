import 'package:flutter/material.dart';
import 'package:so_mobile_app/presentation/screens/__screens__.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              const SignupTopScreen(),
              const SizedBox(height: 40),
              const SignupBottomScreen()
            ],
          ),
        ),
      ),
    );
  }
}
