class Result {
  Result({
    required this.name,
    required this.buying,
    required this.selling,
  });

  String name;
  String buying;
  String selling;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
