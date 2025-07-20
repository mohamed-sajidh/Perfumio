import 'package:perfumio/core/config.dart';

class ApiConstants {
  static String baseUrl = ApiConfig.baseUrl;

  static String loginEndPoint = '$baseUrl/api/v1/anonymous-login';
  static String productEndPoint = '$baseUrl/api/v1/home';
}
