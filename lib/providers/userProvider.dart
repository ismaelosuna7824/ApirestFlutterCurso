import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/userModel.dart';

const baseUrl = "http://192.168.100.4:5000";

class ApiUser {
  static Future getUser() async {
    var url = baseUrl + "/todos";
    final response = await http.get(Uri.parse(url));
    Iterable userResponse = json.decode(response.body);
    List<User> list =
        userResponse.map((model) => User.fromJson(model)).toList();
    return list;
  }

  static Future createUser(User user) async {
    Map data = {"id": user.id, "name": user.name, "lastname": user.lastname};

    var url = baseUrl + "/save";
    return await http.post(Uri.parse(url),
        body: json.encode(data), headers: {"Content-Type": "application/json"});
  }

  static Future updateUser(User user) async {
    var url = baseUrl + "/update";
    Map data = {"id": user.id, "name": user.name, "lastname": user.lastname};
    return await http.put(Uri.parse(url),
        body: json.encode(data), headers: {"Content-Type": "application/json"});
  }

  static Future deleteUser(parametes) async {
    var url = baseUrl + "/delete";
    return await http.delete(Uri.parse(url),
        body: parametes, headers: {"Content-Type": "application/json"});
  }
}
