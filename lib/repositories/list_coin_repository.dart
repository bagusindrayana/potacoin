import 'package:dio/dio.dart';
import 'package:potacoin/models/coin.dart';
import 'package:potacoin/providers/api_provider.dart';

class ListCoinRepository {
  Future<List<Coin>?> getCoin() async {
    return Dio()
        .get("${ApiProvider.getBaseUrl()}/coins/markets?vs_currency=idr")
        .then((response) {
      //transform json to coin
      return List<Coin>.from(response.data.map((x) => Coin.fromJson(x)));
    });
  }
}
