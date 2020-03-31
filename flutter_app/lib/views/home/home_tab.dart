import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/classes/all_classes.dart';
import 'package:flutter_app/views/home/home_view.dart';
import 'package:flutter_app/views/loadmore/tab.dart';
import 'package:flutter_app/views/test/test.dart';

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
    HomeApp(),
    ClassesApp(),
    HomeScreen(),
    MyAppTest(),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xin chào Hoàng Văn Trưởng'),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.notifications), onPressed: () {}),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 5),
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc32c37),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Trang chủ'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Tìm Kiếm'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text('Khoá học của tôi'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Tài khoản'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Cài đặt'),
              backgroundColor: Colors.blue)
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
