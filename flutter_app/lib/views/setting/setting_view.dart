import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/home_view.dart';

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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt chung'),
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return HomeApp();
              }));
            }),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xFF000000)))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.settings),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 250.0),
                        child: Text(
                          'Cài đặt',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70.0),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xFF000000)))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.settings),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 230.0),
                        child: Text(
                          'Lịch học',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xFF000000)))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.settings),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 220.0),
                        child: Text(
                          'Giao dịch',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70.0),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xFF000000)))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.settings),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 230.0),
                        child: Text(
                          'Trợ giúp',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70.0),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 4.0, color: Color(0xFF000000)))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.settings),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 240.0),
                        child: Text(
                          'Góp ý ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70.0),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(width: 4.0, color: Color(0xFF000000)))),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.settings),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 200.0),
                        child: Text(
                          'Đăng xuất',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
