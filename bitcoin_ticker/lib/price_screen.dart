import 'dart:io' show Platform;

import 'package:bitcoin_ticker/models/ExchangeRate.dart';
import 'package:bitcoin_ticker/services/coin_api_service.dart';
import 'package:bitcoin_ticker/services/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const doubleBounce = Center(
  child: SpinKitDoubleBounce(
    color: Colors.black,
    size: 50.0,
  ),
);

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedCryptoCurrency = 'BTC';
  ExchangeRate exchangeRate;
  List<Widget> exchangeCards;

  DropdownButton<String> androidDropDown() {
    return DropdownButton<String>(
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        getAllPriceCards(selectedCurrency);
      },
      items: CoinData().getCurrencyListAsDropdownMenuItems(),
      value: selectedCurrency,
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
        getAllPriceCards(selectedCurrency);
      },
      children: CoinData().getCurrencyListAsTextWidgets(),
    );
  }

  Future<ExchangeRate> getExchangeRate(
      selectedCurrency, selectedCryptoCurrency) async {
    return await CoinApiService()
        .getExchangeRate(selectedCurrency, selectedCryptoCurrency);
  }

  String getFinalQuoteText(
      ExchangeRate exchangeRate, currency, cryptoCurrency) {
    if (exchangeRate != null) {
      return '1 $cryptoCurrency = ${exchangeRate.rate.toStringAsFixed(2)} $currency';
    } else {
      return '1 $cryptoCurrency = 🤷 $currency';
    }
  }

  void getAllPriceCards(selectedCurrency) async {
    List<Widget> cards = [];

    for (String crypto in cryptoList) {
      ExchangeRate exchangeRate =
          await getExchangeRate(selectedCurrency, crypto);

      Padding currencyCard = Padding(
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
              getFinalQuoteText(exchangeRate, crypto, selectedCurrency),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

      cards.add(currencyCard);
    }

    cards.add(Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.lightBlue,
      child: Platform.isIOS ? iOSPicker() : androidDropDown(),
    ));

    setState(() {
      exchangeCards = cards;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllPriceCards(selectedCurrency);
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
        children: exchangeCards == null ? [doubleBounce] : exchangeCards,
      ),
    );
  }
}

/*
,*/
