import 'package:coin_fucker/constants.dart';
import 'package:flutter/material.dart';
import 'firstPage.dart';
void main() => runApp(CoinFucker());

class CoinFucker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kBackgroundColor,
        accentColor: Color(0xFFEE5A24),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: FirstPage(),
    );
  }
}
