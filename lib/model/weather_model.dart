
import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.result,
  });

  List<Results> result;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    result: List<Results>.from(json["result"].map((x) => Results.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Results {
  Results({
    required this.date,
    required this.day,
    required this.icon,
    required this.description,
    required this.status,
    required this.degree,
    required this.min,
    required this.max,
    required this.night,
    required this.humidity,
  });

  String date;
  String day;
  String icon;
  String description;
  String status;
  String degree;
  String min;
  String max;
  String night;
  String humidity;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    date: json["date"],
    day: json["day"],
    icon: json["icon"],
    description: json["description"],
    status: json["status"],
    degree: json["degree"],
    min: json["min"],
    max: json["max"],
    night: json["night"],
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "day": day,
    "icon": icon,
    "description": description,
    "status": status,
    "degree": degree,
    "min": min,
    "max": max,
    "night": night,
    "humidity": humidity,
  };
}
