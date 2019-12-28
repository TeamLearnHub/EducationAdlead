import 'package:flutter_app/repository/user_repository.dart';
import 'package:flutter_app/views/login/login_contact.dart';

class LoginPreseneter {
  LoginContact _view;
  UserRepository _userRepository;

  LoginPreseneter(this._view) {
    _userRepository = UserRepositoryImpl();
  }

  void login(String email, String password) {
    _userRepository.login(email, password).listen((_) {
      _view.onLoginSuccess();
    }).onError((exception) {
      _view.showError(exception);
    });
  }
}
