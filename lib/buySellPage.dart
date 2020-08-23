import 'package:coin_fucker/constants.dart';
import 'package:coin_fucker/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:http/http.dart';
import 'icon.dart';
import 'getCoins.dart';

class buySellPage extends StatefulWidget {
  @override
  _buySellPageState createState() => _buySellPageState();
}

class _buySellPageState extends State<buySellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.crop_square,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Select Coin"
                    ),
                    Text(
                      "Bitcoin"
                    ),
                    Text(
                      "0.005464"
                    ),
                  ],
                ),
                margin: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
