import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/account/my_account.dart';
import 'package:flutter_app/views/course/my_course.dart';
import 'package:flutter_app/views/home/home_view.dart';
import 'package:flutter_app/views/search/search_view.dart';
import 'package:flutter_app/views/setting/setting_view.dart';
import 'package:flutter_app/views/test/test.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeTabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomeTabPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeTabPage extends StatefulWidget {
  @override
  HomeTabState createState() {
    // TODO: implement createState
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTabPage> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    SearchViewPage(),
    MyCoursePage(),
    MyAccountApp(),
    MyHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var ic_home = new Image(
        image: AssetImage('assets/ic_home.png'), height: 35, width: 50);
    var ic_setting = new Image(
        image: AssetImage('assets/ic_setting.png'), height: 35, width: 50);
    var ic_course = new Image(
        image: AssetImage('assets/ic_course.png'), height: 35, width: 50);
    var ic_account = new Image(
        image: AssetImage('assets/ic_account.png'), height: 35, width: 50);
    var ic_search = new Image(
        image: AssetImage('assets/ic_search.png'), height: 35, width: 50);
    // TODO: implement build
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: ic_home,
              title: Text('Trang chủ',
                  style: TextStyle(
                      color: Hexcolor('#AA3234'), fontWeight: FontWeight.bold)),
              backgroundColor: Hexcolor('#FFFFFF')),
          BottomNavigationBarItem(
              icon: ic_search,
              title: Text('Tìm Kiếm',
                  style: TextStyle(
                      color: Hexcolor('#AA3234'), fontWeight: FontWeight.bold)),
              backgroundColor: Hexcolor('#FFFFFF')),
          BottomNavigationBarItem(
              icon: ic_course,
              title: Text('Khoá học của tôi',
                  style: TextStyle(
                      color: Hexcolor('#AA3234'), fontWeight: FontWeight.bold)),
              backgroundColor: Hexcolor('#FFFFFF')),
          BottomNavigationBarItem(
              icon: ic_account,
              title: Text('Tài khoản',
                  style: TextStyle(
                      color: Hexcolor('#AA3234'), fontWeight: FontWeight.bold)),
              backgroundColor: Hexcolor('#FFFFFF')),
          BottomNavigationBarItem(
              icon: ic_setting,
              title: Text('Cài đặt',
                  style: TextStyle(
                      color: Hexcolor('#AA3234'), fontWeight: FontWeight.bold)),
              backgroundColor: Hexcolor('#FFFFFF'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
