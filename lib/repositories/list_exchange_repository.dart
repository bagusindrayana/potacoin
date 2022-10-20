import 'package:dio/dio.dart';
import 'package:potacoin/models/exchange.dart';
import 'package:potacoin/providers/api_provider.dart';

class ListExchangeRepository {
  Future<List<Exchange>?> getExchange() async {
    return Dio().get("${ApiProvider.getBaseUrl()}/exchanges").then((response) {
      //transform json to coin
      return List<Exchange>.from(
          response.data.map((x) => Exchange.fromJson(x)));
    });
  }
}
