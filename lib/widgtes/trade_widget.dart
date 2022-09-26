import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jadeais/widgtes/coin_card.dart';

import '../../../helper/coin_model.dart';
import 'package:http/http.dart' as http;


class TradeWidget extends StatefulWidget {
  const TradeWidget({Key? key}) : super(key: key);

  @override
  State<TradeWidget> createState() => _TradeWidgetState();
}

class _TradeWidgetState extends State<TradeWidget> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.isNotEmpty) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.fromJson(map));
           
          }
        }
        setState(() {
          coinList;
        });
      }
      return coinList;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  void initState() {
    fetchCoin();

    Timer.periodic(const Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
       
        backgroundColor: Colors.grey[300],
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: coinList.length,
          itemBuilder: (context, index) {
            if (coinList.isNotEmpty) {
              return CoinCard(
                height: height,
                width: width,
                name: coinList[index].name!,
                symbol: coinList[index].symbol!,
                imageUrl: coinList[index].imageUrl!,
                price: coinList[index].price!.toDouble(),
                change: coinList[index].change!.toDouble(),
                changePercentage: coinList[index].changePercentage!.toDouble(),
              );
            } else {
              return Center(child: CupertinoActivityIndicator());
            }
          },
        ));
  }
}
