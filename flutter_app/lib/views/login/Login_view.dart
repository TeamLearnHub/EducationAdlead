import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/util/Preferences.dart';
import 'package:flutter_app/views/home/home_tab.dart';
import 'package:flutter_app/views/login/login_contact.dart';
import 'package:flutter_app/views/login/login_presenter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageSate();
  }
}

class _LoginPageSate extends State<LoginPage> implements LoginContact {
  TextEditingController cntrlEmail = TextEditingController();
  TextEditingController cntrlPassword = TextEditingController();

  LoginPreseneter _preseneter;
  bool isLoggedIn = false;
  String name = '';

  doLogin(String username, String password) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    _preseneter = LoginPreseneter(this);
    autoLogin();
    super.initState();
  }

  void autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('username');
    print("LoginPage" + userId);
    if (userId != null) {
      setState(() {
        isLoggedIn = true;
        name = userId;
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        Preferences.clear();
        return HomeTabApp();
      }));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/ic_logo.png');
    var image = new Image(image: assetsImage, width: 200.0, height: 120.0);
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 90.0),
                  Align(alignment: Alignment.center, child: image),
                  Text('Grow Your People',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Hexcolor('#F5F6F9'),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: cntrlEmail,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tên đăng nhập',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    margin: EdgeInsets.only(top: 32),
                    padding:
                        EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Hexcolor('#F5F6F9'),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ]),
                    child: TextFormField(
                      controller: cntrlPassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      setState(() {
                        doLogin(
                            cntrlEmail.toString(), cntrlPassword.toString());
                      });
//                      Preferences.setToken("ojsjjsjjsjs");
//                    print('hello token = ' +Preferences.getToken());
//                      _preseneter.login(cntrlEmail.toString(), cntrlPassword.toString());
                      if (Preferences.getToken() == null) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          Preferences.clear();
                          return HomeTabApp();
                        }));
                      } else {
//                        print('hello token = ' +Preferences.getToken());
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomeTabApp();
                        }));
                      }
                    },
                    child: new Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Hexcolor('#FAA244'), Hexcolor('#FF8400')],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'Đăng nhập'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Quên mật khẩu ?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onLoginSuccess() {
    // TODO: implement onLoginSuccess
  }

  @override
  void showError(String message) {
    // TODO: implement showError
  }
}
