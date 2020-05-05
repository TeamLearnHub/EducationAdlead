import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String _token = "PREF_TOKEN";
  static String _userName = "PRE_USERNAME";

//  static Future<String> getToken() async {
//    final SharedPreferences preferences = await SharedPreferences.getInstance();
//    return preferences.getString(_token);
//  }

//  static Observable<void> setToken(String token) {
//    return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
//      return prefs.setString(_token, token);
//    });
//  }

//  static Observable<void> clear() {
//    return Observable.fromFuture(SharedPreferences.getInstance()).map((prefs) {
//      return prefs.clear();
//    });
//  }

  static setToken(String token) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_token, token);
  }

  static getToken() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_token);
  }

  static setUserName(String userName) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_userName, userName);
  }

  static getUserName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_userName);
  }

   Future<String> _nameSaver(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name2', userName);
    prefs.setString('school2', 'bach khoa ');
    return 'saved';
  }

  static _nameRetriever() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name2') ?? '';
    final school = prefs.getString('school2') ?? '';

    print(name);
    print(school);
  }

  static clear() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(_token);
  }
}
