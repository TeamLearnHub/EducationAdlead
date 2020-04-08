import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String _token = "PREF_TOKEN";

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

  static clear() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(_token);
  }
}
