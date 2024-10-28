import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:so_mobile_app/config/constants/environment.dart';

import 'presentation/routes/__routes__.dart';
import 'presentation/screens/__screens__.dart';

void main() async {
  // print("aaaaaaaaaaaaaaaaaaa");
  // if (File('.env').existsSync()) {
  //   // await Environment.initiEnvironment();
  //   await dotenv.load(fileName: ".env");
  //   print("eeeeeeeeeeeeeeeeeeeee");
  //   print(dotenv.env);
  // } else {
  //   await dotenv.load(fileName: ".env");
  //   String apiUrl = dotenv.env["API_URL"] ?? "API URL should be initialezed";
  //   print(apiUrl);
  //   print("El archivo .env no se encuentra en la raíz del proyecto");
  // }

  await dotenv.load(fileName: ".env");
  String apiUrl = dotenv.env["API_URL"] ?? "API URL should be initialezed";
  print("URL API : " + apiUrl);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SO_Mobile',
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
