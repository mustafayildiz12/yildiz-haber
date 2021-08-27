import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:turkey_news/model/article_model.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
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
}
