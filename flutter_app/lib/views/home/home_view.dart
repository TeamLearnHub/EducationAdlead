import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/comment/comment_view.dart';
import 'package:flutter_app/views/download/download_view.dart';
import 'package:flutter_app/views/setting/setting_view.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SettingApp();
                }));
              }),
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
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(color: Colors.tealAccent, width: 4.0)),
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 17),
                        hintText: 'Tìm kiếm khoá học',
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(5)),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return downloadApp();
                    }));
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.book),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 120.0),
                        child: Text(
                          'Khoá học của tôi'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.book),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 128.0),
                        child: Text(
                          'Lộ trình học tập'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.book),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 248.0),
                        child: Text(
                          'đề thi'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.book),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 138.0),
                        child: Text(
                          'Lớp học sắp tới'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.book),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 128.0),
                        child: Text(
                          'kết quả học tập'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Icon(Icons.book),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 128.0),
                        child: Text(
                          'họp trực tuyến'.toUpperCase(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
