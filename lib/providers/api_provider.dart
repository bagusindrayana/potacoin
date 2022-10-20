import 'package:dio/dio.dart';

class ApiProvider {
  static String getBaseUrl() {
    return "https://api.coingecko.com/api/v3";
  }
}