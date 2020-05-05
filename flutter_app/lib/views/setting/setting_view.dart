import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/feeedback/feedback.dart';
import 'package:flutter_app/views/help/help.dart';
import 'package:flutter_app/views/history/history.dart';
import 'package:flutter_app/views/login/Login_view.dart';
import 'package:flutter_app/views/setting/settingdetail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingPage(),
    );
  }
}

class SettingPage extends StatefulWidget {
  @override
  _SettingPageSate createState() {
    // TODO: implement createState
    return _SettingPageSate();
  }
}

class _SettingPageSate extends State<SettingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 6.5,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/ic_toolbar.png"),
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 13.5,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Cài đặt",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 30),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image(
                                image: AssetImage("assets/ic_notification.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))),
        Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Setting();
                      }));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/ic_setting.png"),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Hexcolor('#434343')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Cài đặt chung",
                                style: TextStyle(
                                    color: Hexcolor('#434343'),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            43),
                              ),
                            ],
                          ),
                          Image(image: AssetImage("assets/ic_next.png"))
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/ic_meeting.png"),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Hexcolor('#434343')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Lịch học",
                                style: TextStyle(
                                    color: Hexcolor('#434343'),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            43),
                              ),
                            ],
                          ),
                          Image(image: AssetImage("assets/ic_next.png"))
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LichSu();
                      }));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/ic_meeting.png"),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Hexcolor('#434343')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Giao dịch",
                                style: TextStyle(
                                    color: Hexcolor('#434343'),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            43),
                              ),
                            ],
                          ),
                          Image(image: AssetImage("assets/ic_next.png"))
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return TroGiup();
                      }));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/ic_meeting.png"),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Hexcolor('#434343')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Trợ giúp",
                                style: TextStyle(
                                    color: Hexcolor('#434343'),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            43),
                              ),
                            ],
                          ),
                          Image(image: AssetImage("assets/ic_next.png"))
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FeedBack();
                      }));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage("assets/ic_meeting.png"),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Hexcolor('#434343')),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Góp ý",
                                style: TextStyle(
                                    color: Hexcolor('#434343'),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            43),
                              ),
                            ],
                          ),
                          Image(image: AssetImage("assets/ic_next.png"))
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                  GestureDetector(
                    onTap: () {
                      logout();
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                  image: AssetImage(
                                    "assets/ic_meeting.png",
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  color: Colors.red),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Đăng xuất",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            43),
                              ),
                            ],
                          ),
                          Image(image: AssetImage("assets/ic_next.png"))
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.brown,
                  ),
                ],
              ),
            ))
      ],
    ));
  }
}
