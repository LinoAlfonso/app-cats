import 'package:app_cats/src/config/config.dart';

class ApiHeaders{

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'x-api-key': Environment.apiKey,
  };



  Duration timeOut = const Duration(seconds: 50);
}