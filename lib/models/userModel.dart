import 'dart:convert';

// List<User> userFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

// String userToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
