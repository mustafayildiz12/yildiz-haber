// To parse this JSON data, do
//
//     final doviz = dovizFromJson(jsonString);

import 'dart:convert';

Doviz dovizFromJson(String str) => Doviz.fromJson(json.decode(str));

String dovizToJson(Doviz data) => json.encode(data.toJson());

class Doviz {
  Doviz({
    required this.success,
    required this.result,
  });

  bool success;
  List<Resultd> result;

  factory Doviz.fromJson(Map<String, dynamic> json) => Doviz(
        success: json["success"],
        result:
            List<Resultd>.from(json["result"].map((x) => Resultd.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Resultd {
  Resultd({
    required this.name,
    required this.buying,
    required this.selling,
  });

  String name;
  String buying;
  String selling;

  factory Resultd.fromJson(Map<String, dynamic> json) => Resultd(
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
