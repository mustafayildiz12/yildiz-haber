import 'dart:convert';
import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:turkey_news/model/doviz_model.dart';

class DovizApi {
  var logger = Logger();

  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
    "apikey 7xKn1j9d7jLM4YQLbLSb18:7FCyvhdiC0LhOK1Ogkuxis",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  //DÖVİZ
  var dovizUrl = "https://api.collectapi.com/economy/allCurrency";

  Future<List<Result>> getMoney() async {
    Response res = await http.get(Uri.parse(dovizUrl), headers: headers);

    logger.i(res.body);
    logger.i(res.statusCode);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<dynamic, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['result'];
      List<Result> money =
      body.map((dynamic item) => Result.fromJson(item)).toList();

      return money;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future getHtml() async {
    Response res = await http.get(
      Uri.parse(
          "https://namazvakitleri.diyanet.gov.tr/tr-TR/9146/adana-icin-namaz-vakti"),
    );

    if (res.statusCode == 200) {
      var doc = parse(res.body);
      print("Sabah Namazı :${doc.getElementById("tpt-time")}");
    } else {
      throw ("Can't get the Articles");
    }
  }
}
