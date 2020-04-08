import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/util/Preferences.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAccountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAccountPage(),
    );
  }
}

class MyAccountPage extends StatefulWidget {
  @override
  MyAccountSate createState() {
    // TODO: implement createState
    return MyAccountSate();
  }
}

class MyAccountSate extends State<MyAccountPage> {
  var ic_notification = new Image(
      image: AssetImage('assets/ic_notification.png'), height: 35, width: 50);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Hexcolor('#FAA244'), Hexcolor('#FF8400')],
          )),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Hello, Thang'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ],
            ),
            flexibleSpace: Image(
                image: AssetImage('assets/ic_toolbar.png'), fit: BoxFit.cover),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(icon: ic_notification, onPressed: () {}),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10),
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
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Preferences.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Image(image: AssetImage('assets/ic_learning.png')),
                        SizedBox(width: 18.0),
                        Text('Lộ trình học tập',
                            style: TextStyle(
                                fontSize: 18.0, color: Hexcolor('#434343'))),
                        SizedBox(width: 160.0),
                        Image(image: AssetImage('assets/ic_next.png'))
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10.0),
          Image(image: AssetImage('assets/ic_line_big.png')),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Image(image: AssetImage('assets/ic_exam.png')),
                        SizedBox(width: 18.0),
                        Text('Đề thi',
                            style: TextStyle(
                                fontSize: 18.0, color: Hexcolor('#434343'))),
                        SizedBox(width: 245.0),
                        Image(image: AssetImage('assets/ic_next.png'))
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10.0),
          Image(image: AssetImage('assets/ic_line_big.png')),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Image(image: AssetImage('assets/ic_result.png')),
                        SizedBox(width: 18.0),
                        Text('Kết quả học tập',
                            style: TextStyle(
                                fontSize: 18.0, color: Hexcolor('#434343'))),
                        SizedBox(width: 160.0),
                        Image(image: AssetImage('assets/ic_next.png'))
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10.0),
          Image(image: AssetImage('assets/ic_line_big.png')),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Image(image: AssetImage('assets/ic_meeting.png')),
                        SizedBox(width: 18.0),
                        Text('Họp trực tuyến',
                            style: TextStyle(
                                fontSize: 18.0, color: Hexcolor('#434343'))),
                        SizedBox(width: 165.0),
                        Image(image: AssetImage('assets/ic_next.png'))
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 10.0),
          Image(image: AssetImage('assets/ic_line_big.png')),
        ],
      ),
    );
  }
}
