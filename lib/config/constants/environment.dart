import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static bool debug = dotenv.env["DEBUG"] == "true";

  static String apiUrl =
      dotenv.env["API_URL"] ?? "API URL should be initialezed";

  static initiEnvironment() async {
    await dotenv.load(fileName: ".env");
  }
}
