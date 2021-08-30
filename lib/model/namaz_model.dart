// To parse this JSON data, do
//
//     final namaz = namazFromJson(jsonString);

import 'dart:convert';

Namaz namazFromJson(String str) => Namaz.fromJson(json.decode(str));

String namazToJson(Namaz data) => json.encode(data.toJson());

class Namaz {
  Namaz({
    required this.success,
    required this.result,
  });

  bool success;
  List<Resultn> result;

  factory Namaz.fromJson(Map<String, dynamic> json) => Namaz(
    success: json["success"],
    result: List<Resultn>.from(json["result"].map((x) => Resultn.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Resultn {
  Resultn({
    required this.saat,
    required this.vakit,
  });

  String saat;
  String vakit;

  factory Resultn.fromJson(Map<String, dynamic> json) => Resultn(
    saat: json["saat"],
    vakit: json["vakit"],
  );

  Map<String, dynamic> toJson() => {
    "saat": saat,
    "vakit": vakit,
  };
}
