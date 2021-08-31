import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:turkey_news/model/article_model.dart';
import 'package:turkey_news/model/covid_model.dart';
import 'package:turkey_news/model/doviz_model.dart';
import 'package:turkey_news/model/namaz_model.dart';
import 'package:turkey_news/model/weather_model.dart';

class ApiService {
  var logger = Logger();

  var articleUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&apiKey=ac2691bc62484fa9a09aeaac78637cd2";
  var healthUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=health&apiKey=ac2691bc62484fa9a09aeaac78637cd2";
  var businesUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=ac2691bc62484fa9a09aeaac78637cd2";
  var entUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=entertainment&apiKey=ac2691bc62484fa9a09aeaac78637cd2";
  var scienceUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=science&apiKey=ac2691bc62484fa9a09aeaac78637cd2";
  var sportsUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=sports&apiKey=ac2691bc62484fa9a09aeaac78637cd2";
  var techUrl =
      "https://newsapi.org/v2/top-headlines?country=tr&category=technology&apiKey=ac2691bc62484fa9a09aeaac78637cd2";

  Future<List<Article>> getArticle() async {
    Response res = await http.get(Uri.parse(articleUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getHealth() async {
    Response res = await http.get(Uri.parse(healthUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getSport() async {
    Response res = await http.get(Uri.parse(sportsUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getScience() async {
    Response res = await http.get(Uri.parse(scienceUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getBusiness() async {
    Response res = await http.get(Uri.parse(businesUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getTech() async {
    Response res = await http.get(Uri.parse(techUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Article>> getEnt() async {
    Response res = await http.get(Uri.parse(entUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }

  var baseUrl =
      "https://api.collectapi.com/corona/countriesData?country=Turkey";

  Map<String, String> headers = {
    HttpHeaders.authorizationHeader:
        "apikey 6rzDJTIZ8zmdE16C8bhRWi:1gF8lAE2Rue7VDBWbw9PoE",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  Future<List<Result>> getCovid() async {
    Response res = await http.get(Uri.parse(baseUrl), headers: headers);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['result'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Result> result =
          body.map((dynamic item) => Result.fromJson(item)).toList();

      return result;
    } else {
      throw ("Can't get the Articles");
    }
  }

  var weatherUrl = "https://api.collectapi.com/weather/getWeather?data.lang=tr";

  Future<List<Results>> getWeather(String url) async {
    url = formater(url);
    Response res = await http.get(Uri.parse(url), headers: headers);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['result'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Results> result =
          body.map((dynamic item) => Results.fromJson(item)).toList();

      return result;
    } else {
      throw ("Can't get the Articles");
    }
  }

  String formater(String url) {
    return weatherUrl + url;
  }

  var namazUrl = "https://api.collectapi.com/pray/all";

  Future<List<Resultn>> getNamaz(String urx) async {
    urx = namazArama(urx);
    Response res = await http.get(Uri.parse(urx), headers: headers);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['result'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Resultn> namaz =
          body.map((dynamic item) => Resultn.fromJson(item)).toList();

      return namaz;
    } else {
      throw ("Can't get the Articles");
    }
  }

  String namazArama(String urx) {
    return namazUrl + urx;
  }

  //DÖVİZ
  var dovizUrl = "https://api.collectapi.com/economy/allCurrency";

  Future<List<Resultd>> getMoney() async {
    Response res = await http.get(Uri.parse(dovizUrl), headers: headers);
    logger.i(res.body);
    logger.i(res.statusCode);

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['results'];
      List<Resultd> money =
          body.map((dynamic item) => Resultd.fromJson(item)).toList();

      return money;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
