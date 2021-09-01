// To parse this JSON data, do
//
//     final doviz = dovizFromJson(jsonString);

import 'dart:convert';

Doviz dovizFromJson(dynamic str) => Doviz.fromJson(json.decode(str));

String dovizToJson(Doviz data) => json.encode(data.toJson());

class Doviz {
  Doviz({
    required this.success,
    required this.result,
  });

  bool success;
  List<Result> result;

  factory Doviz.fromJson(Map<dynamic, dynamic> json) => Doviz(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.name,
    required this.buying,
    required this.selling,
  });

  String name;
  double buying;
  double selling;

  factory Result.fromJson(Map<dynamic, dynamic> json) => Result(
    name: json["name"],
    buying: json["buying"],
    selling: json["selling"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "buying": buying,
    "selling": selling,
  };
}
