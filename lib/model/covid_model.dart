// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

Covid covidFromJson(String str) => Covid.fromJson(json.decode(str));

String covidToJson(Covid data) => json.encode(data.toJson());

class Covid {
  Covid({
    required this.success,
    required this.result,
  });

  bool success;
  List<Resultc> result;

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        success: json["success"],
        result:
            List<Resultc>.from(json["result"].map((x) => Resultc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Resultc {
  Resultc({
    required this.country,
    required this.totalCases,
    required this.newCases,
    required this.totalDeaths,
    required this.newDeaths,
    required this.totalRecovered,
    required this.activeCases,
  });

  String country;
  String totalCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;

  factory Resultc.fromJson(Map<String, dynamic> json) => Resultc(
        country: json["country"],
        totalCases: json["totalCases"],
        newCases: json["newCases"],
        totalDeaths: json["totalDeaths"],
        newDeaths: json["newDeaths"],
        totalRecovered: json["totalRecovered"],
        activeCases: json["activeCases"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "totalCases": totalCases,
        "newCases": newCases,
        "totalDeaths": totalDeaths,
        "newDeaths": newDeaths,
        "totalRecovered": totalRecovered,
        "activeCases": activeCases,
      };
}
