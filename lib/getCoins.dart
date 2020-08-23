import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'constants.dart';


class GetCoin {
  var url = kApiURL;

  Future getData(String x) async {
    Response response = await get(kApiURL + x + kApiKey);
    print(response.body);
    String data = response.body;
    var decodedData = jsonDecode(data);

    return decodedData;
  }
}


