import 'dart:convert';
import 'package:http/http.dart' as http;
import 'exeption.dart';

class ErrorHandlers {
  static dynamic processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = response.body;
        return responseJson;
      case 201:
        final responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 403: //Forbidden
        throw UnAuthorizedException(jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        throw NotFoundException(jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}
