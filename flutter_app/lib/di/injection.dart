import 'package:flutter_app/repository/user_repository.dart';
import 'package:flutter_app/service/Network_service.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  UserRepository get usersRepository {
    return new UserRepositoryImpl();
  }
  NetworkService get networkService{
    return new NetworkService();
  }
}
