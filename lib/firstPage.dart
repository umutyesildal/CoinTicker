import 'package:coin_fucker/buySellPage.dart';
import 'package:coin_fucker/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:http/http.dart';
import 'icon.dart';
import 'getCoins.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Coin coin = Coin();
  GetCoin getcoin = GetCoin();

  @override
  void initState() {
    super.initState();
    setState(() {
      updateUI('USD');
    });
  }

  double btc = 0;
  double eth = 0;
  double dash = 0;
  double ltc = 0;
  double xrp = 0;
  double bch = 0;
  double bnc = 0;
  double neo = 0;
  double iota = 0;
  double etc = 0;
  double btcAmount = 1.5;
  double ethAmount = 3.7;
  double dashAmount = 5.7;
  double ltcAmount = 3.4;
  double xrpAmount = 1.7;
  double bchAmount = 2.87;
  double bncAmount = 92;
  double neoAmount = 1;
  double iotaAmount = 600;
  double etcAmount = 73;

  Future updateUI(String x) async {
    var data = await getcoin.getData(x);

    btc = data['BTC'][x];
    eth = data['ETH'][x];
    dash = data['DASH'][x];
    ltc = data['LTC'][x];
    xrp = data['XRP'][x];
    bch = data['BCH'][x];
    bnc = data['BNC'][x];
    neo = data['NEO'][x];
    iota = data['MIOTA'][x];
    etc = data['ETC'][x];

    print(btc);
    print(eth);
  }

  double getMoney(){
    double xd = (btcAmount*btc)+(ethAmount*eth)+(dashAmount*dash)+(ltcAmount*ltc)+(xrpAmount*xrp)+(bchAmount*bch)+(bncAmount*bnc)+(neoAmount*neo)+(iotaAmount*iota)+(etcAmount*etc);
    return xd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: 350.0,
                  height: 150.0,
                  margin: EdgeInsets.only(top: 35.0),
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        offset: new Offset(
                            MediaQuery.of(context).size.width / 55,
                            MediaQuery.of(context).size.width / 75),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 75,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Current Balance",
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          color: kCoinAmountColor,
                                          letterSpacing: 2.0),
                                    ),
                                    Text(
                                      getMoney().toString(),
                                      style: TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.white,
                                          letterSpacing: 2.0),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(
                                            Icons.arrow_upward,
                                            color: kBuyColor,
                                          ),
                                          Text(
                                            "\$4.431",
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              color: kBuyColor,
                                              letterSpacing: 2.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "24HR",
                                        style: TextStyle(
                                          color: kCoinAmountColor,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: RefreshIndicator(
                onRefresh: () async {
                  updateUI('USD');
                },
                child: ListView(
                  children: <Widget>[
                    CoinCards(xoinName: "BTC", amount: btcAmount, xoinValue: btc),
                    CoinCards(xoinName: "ETH", amount: ethAmount, xoinValue: eth),
                    CoinCards(xoinName: "DASH", amount: dashAmount, xoinValue: dash),
                    CoinCards(xoinName: "LTC", amount: ltcAmount, xoinValue: ltc),
                    CoinCards(xoinName: "XRP", amount: xrpAmount, xoinValue: xrp),
                    CoinCards(xoinName: "BCH", amount: bchAmount, xoinValue: bch),
                    CoinCards(xoinName: "BNC", amount: bncAmount, xoinValue: bnc),
                    CoinCards(xoinName: "NEO", amount: neoAmount, xoinValue: neo),
                    CoinCards(xoinName: "IOTA", amount: iotaAmount, xoinValue: iota),
                    CoinCards(xoinName: "ETC", amount: etcAmount, xoinValue: etc),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext buildContext,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Material(
                              color: kBackgroundColor,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        margin: EdgeInsets.all(25.0),
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        decoration: new BoxDecoration(
                                          color: kCardColor,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(15.5),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 8,
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 25.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 4,
                                                      child: IconButton(
                                                        icon: Icon(Icons.clear),
                                                        color: Colors.white,
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 2,
                                                            child: Text(
                                                              "Select Coin",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      16.0,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              size: 20.0,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Text(
                                                        "Bitcoin",
                                                        style: TextStyle(
                                                            fontSize: 32.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        "0.005464",
                                                        style: TextStyle(
                                                          fontSize: 32.0,
                                                          color:
                                                              kCoinAmountColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: SizedBox(),
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Column(
                                                children: <Widget>[
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(),
                                                  ),
                                                  Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  3,
                                                              child: Center(
                                                                child: Text(
                                                                  "Buy",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    kBuyColor,
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.5),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: SizedBox(),
                                                          ),
                                                          Expanded(
                                                            flex: 6,
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  3,
                                                              child: Center(
                                                                child: Text(
                                                                  "Sell",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    kSellColor,
                                                                shape: BoxShape
                                                                    .rectangle,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.5),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                  Expanded(
                                                    flex: 1,
                                                    child: SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.plus_one,
                      color: Colors.white,
                    ),
                  ),
                ),
                margin: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      offset: new Offset(5.0, 5.0),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CoinCards extends StatelessWidget {
  const CoinCards({@required this.xoinName, this.xoinValue, this.amount});

  final String xoinName;
  final double amount;
  final double xoinValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
        color: kBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  xoinName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  amount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: kCoinAmountColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "\$" + xoinValue.toString(),
              style: TextStyle(fontSize: 24.0, color: kBuyColor),
            ),
          ),
        ],
      ),
    );
  }
}

/*Expanded(
flex: 1,
child: CoinCards(xoinName: "BTC", amount: 1.0, xoinValue: btc),
),
Expanded(
flex: 1,
child: CoinCards(xoinName: "ETH", amount: 1.0, xoinValue: eth),
),
Expanded(
flex: 1,
child: CoinCards(xoinName: "DASH", amount: 1.0, xoinValue: dash),
),
Expanded(
flex: 1,
child: CoinCards(xoinName: "LTC", amount: 1.0, xoinValue: ltc),
),
Expanded(
flex: 1,
child: CoinCards(xoinName: "XRP", amount: 1.0, xoinValue: xrp),
),

 */
