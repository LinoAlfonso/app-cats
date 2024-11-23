import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl                = dotenv.env['API_URL'] ?? 'not found';
  static String apiKey                = dotenv.env['API_KEY_CATS'] ?? 'not found';

}
