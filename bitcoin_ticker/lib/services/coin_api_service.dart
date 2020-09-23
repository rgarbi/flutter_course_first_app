import 'dart:convert';

import 'package:bitcoin_ticker/auth/keys.dart';
import 'package:bitcoin_ticker/models/ExchangeRate.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://rest.coinapi.io/v1/exchangerate/';

class CoinApiService {
  Future<String> _getApiKey() async {
    Secret secret =
    await SecretLoader(secretPath: 'assets/secrets.json').load();
    return secret.apikey;
  }

  Future<ExchangeRate> getExchangeRate(String currency,
      String cryptoCurrency) async {
    final String key = await _getApiKey();
    final Map headers = {"X-CoinAPI-Key": key};
    http.Response response = await http.get(
      baseUrl + '$cryptoCurrency/$currency',
      headers: {'X-CoinAPI-Key': key},
    );

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      var json = jsonDecode(data);

      String cryptoCurrencyType = json['asset_id_base'];
      String currencyType = json['asset_id_quote'];
      double rate = json['rate'];
      print(rate);
      return ExchangeRate(cryptoCurrencyType, currencyType, rate);
    } else {
      print(response.statusCode);
      print(response.body);
    }
  }
}
