import 'dart:io' show Platform;

import 'package:bitcoin_ticker/models/ExchangeRate.dart';
import 'package:bitcoin_ticker/services/coin_api_service.dart';
import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedCryptoCurrency = 'BTC';
  ExchangeRate exchangeRate;

  DropdownButton<String> androidDropDown() {
    return DropdownButton<String>(
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
      items: CoinData().getCurrencyListAsDropdownMenuItems(),
      value: selectedCurrency,
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getExchangeRate();
      },
      children: CoinData().getCurrencyListAsTextWidgets(),
    );
  }

  Future<void> getExchangeRate() async {
    ExchangeRate rate = await CoinApiService()
        .getExchangeRate(selectedCurrency, selectedCryptoCurrency);

    setState(() {
      exchangeRate = rate;
    });
  }

  String getFinalQuoteText() {
    if (exchangeRate != null) {
      return '1 $selectedCryptoCurrency = ${exchangeRate.rate.toStringAsFixed(2)} $selectedCurrency';
    } else {
      return '1 $selectedCryptoCurrency = 🤷 $selectedCurrency';
    }
  }

  @override
  void initState() {
    super.initState();
    getExchangeRate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  getFinalQuoteText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropDown(),
          ),
        ],
      ),
    );
  }
}

/*
,*/
