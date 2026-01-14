import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {

  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:8080/api';
  static String get environment => dotenv.env['ENVIRONMENT'] ?? 'development';
  static bool get isDevelopment => environment == 'development';
  static bool get isDebugMode => isDevelopment;

  static void printEnvInfo(){
    if(!isDebugMode) return;
    print('======= 환경 설정 =======');
    print('Environment: $environment');
    print('API URL: $apiBaseUrl');
    print('========================');
  }

}