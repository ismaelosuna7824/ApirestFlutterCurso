import 'dart:convert';

class User {
  String name;
  String? lastname;
  int id;

  User({
    required this.name,
    this.lastname,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        lastname: json["lastname"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "id": id,
      };
}
