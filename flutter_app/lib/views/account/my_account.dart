import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                const Text('Hello, Thang',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
              ],
            ),
            flexibleSpace: Image(
                image: AssetImage('assets/ic_toolbar.png'),
                fit: BoxFit.cover),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {}),
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

    );
  }
}
