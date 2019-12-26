import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<Response> get(String apiUrl) async {
    return http.get(apiUrl);
  }

  Future<Response> post(String _apiBaseUrl, dynamic data) {
    return http.post(_apiBaseUrl, body: data);
  }

  Map<String, dynamic> convertJsonMap(String response) {
    return json.decode(response);
  }

  String getErrorMessgae(dynamic exception) {
    String errorMessgae;
    if (exception is SocketException) {
      errorMessgae = exception.message;
    } else if (exception is TimeoutException) {
      errorMessgae = exception.message;
    } else if (exception is HttpException) {
      errorMessgae = exception.message;
    }
    return errorMessgae;
  }
}
