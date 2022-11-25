import 'dart:convert';
import 'dart:io';

import 'package:cursoapp/utils/errors_http.dart';
import 'package:cursoapp/utils/exeption.dart';
import 'package:http/http.dart' as http;

import '../models/userModel.dart';

const baseUrl = "http://192.168.100.4:5000";

class ApiUser {
  static Future getUser() async {
    try {
      var url = baseUrl + "/users";
      final response = await http.get(Uri.parse(url));
      final data = ErrorHandlers.processResponse(response);
      Iterable userResponse = json.decode(data);
      List<User> list =
          userResponse.map((model) => User.fromJson(model)).toList();
      return list;
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  static Future createUser(User user) async {
    try {
      Map body = {"id": user.id, "name": user.name, "lastname": user.lastname};

      var url = baseUrl + "/save";
      final response = await http.post(Uri.parse(url),
          body: json.encode(body),
          headers: {"Content-Type": "application/json"});
      final data = ErrorHandlers.processResponse(response);
      return data;
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  static Future updateUser(User user) async {
    try {
      var url = baseUrl + "/update";
      Map body = {"id": user.id, "name": user.name, "lastname": user.lastname};
      final response = await http.put(Uri.parse(url),
          body: json.encode(body),
          headers: {"Content-Type": "application/json"});
      final data = ErrorHandlers.processResponse(response);
      return data;
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  static Future deleteUser(parametes) async {
    try {
      var url = baseUrl + "/delete";
      final response = await http.delete(Uri.parse(url),
          body: parametes, headers: {"Content-Type": "application/json"});
      final data = ErrorHandlers.processResponse(response);
      return data;
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}
