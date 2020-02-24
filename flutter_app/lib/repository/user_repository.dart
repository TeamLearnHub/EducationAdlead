import 'dart:convert';

import 'package:flutter_app/api_endpoint.dart';
import 'package:flutter_app/di/injection.dart';
import 'package:flutter_app/service/Network_service.dart';
import 'package:flutter_app/util/Preferences.dart';
import 'package:flutter_app/util/Request_exception.dart';
import 'package:rxdart/rxdart.dart';

abstract class UserRepository {
  Observable<void> login(String email, String password);

  Observable<void> logout();
}

class UserRepositoryImpl implements UserRepository {
  final NetworkService _networkService = Injector().networkService;
  final JsonDecoder _decoder = new JsonDecoder();

  @override
  Observable<void> login(String email, String password) {
    // TODO: implement login
    Map data = {'email': email, 'password': password};
    return Observable.fromFuture(_networkService.post(ApiEndPoint.LOGIN, data))
        .flatMap((res) {
      if (res.statusCode != 200 || null == res.statusCode) {
        throw new RequestException(""
            "Login error , code : ${res.statusCode},${res.reasonPhrase}");
      }
      final String token = _networkService.convertJsonMap(res.body)["token"];
      return Preferences.setToken(token);
    });
  }

  @override
  Observable<void> logout() {
    // TODO: implement logout
    return Preferences.clear();
  }
}
