import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  List<DropdownMenuItem> getCurrencyListAsDropdownMenuItems() {
    return currenciesList
        .map((value) => DropdownMenuItem(
              child: Text(value),
              value: value,
            ))
        .toList();
  }

  List<Text> getCurrencyListAsTextWidgets() {
    return currenciesList.map((value) => Text(value)).toList();
  }
}
