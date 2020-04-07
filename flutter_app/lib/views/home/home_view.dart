import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/views/classes/classes_detail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as prefix0;

import 'all_classes_home.dart';

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
  List<ClassesModel> _listClasses = List<ClassesModel>();

  List<ClassesModel> parseClasses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    _listClasses = parsed
        .map<ClassesModel>((json) => ClassesModel.fromJson(json))
        .toList();
    return _listClasses;
  }

  Future<List<ClassesModel>> fetchClasses() async {
    final response =
        await prefix0.get('http://demo4855049.mockable.io/gethotvideo');
    if (response.statusCode == 200) {
      return parseClasses(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  var listClasses = [
    'Tất cả các khoá học',
    'khoá học của tôi',
    'lộ trình học tập',
    'đề thi',
    'lịch học sắp tới',
    'kết quả học tập',
    'họp trực tuyến'
  ];

  bool a = true;
  bool b = true;
  bool c = true;
  bool d = true;
  bool e = true;
  bool f = true;
  bool g = true;

  Widget AllClassesWidget() {
    return FutureBuilder(
        future: fetchClasses(),
        builder: (BuildContext context, AsyncSnapshot projectSnap) {
          print(projectSnap.data);
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == null) {
            return GestureDetector(
              child: Center(
                child: Image.network(
                    "https://dzbbmecpa0hd2.cloudfront.net/video/avatar/2019/04/11/14/1554966002_de58c8a6be7d1046.jpg",
                    height: 120,
                    width: 120),
              ),
            );
          }
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Align(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tất cả các khoá học',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.00),
                    ),
                    SizedBox(width: 105.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AllClassesHomePage();
                        }));
                      },
                      child: Text(
                        'Xem thêm'.toUpperCase(),
                        style: TextStyle(
                          color: Hexcolor('#AA3234'),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.00,
                        ),
                      ),
                    )
                  ],
                )),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  ClassesModel project = projectSnap?.data[index];
                  print(" -------" + project.avatar);
                  return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ClassesDetailPage();
                              }));
                            },
                            child: Center(
                              child: Image.network(project?.avatar,
                                  height: 130, width: 130),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ClassesDetailPage();
                              }));
                            },
                            onLongPress: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ClassesDetailPage();
                              }));
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 15.0, left: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text('Kỹ năng quản lý thời gian',
                                          style: TextStyle(color: Colors.black))
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Icon(Icons.person),
                                      ),
                                      Text('30M | ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 1.0),
                                        child: Icon(Icons.home),
                                      ),
                                      Text('05 Lớp | ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                        child: Icon(Icons.closed_caption),
                                      ),
                                      Text('07 ngày',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0,
                                        top: 10.0,
                                        bottom: 10.0,
                                        right: 20.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: new Container(
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.2,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Hexcolor('#FAA244'),
                                                Hexcolor('#FF8400')
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50))),
                                        child: Center(
                                          child: Text(
                                            'Đăng ký'.toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image(
                                      image: AssetImage('assets/ic_line.png')),
                                ],
                              ),
                            ),
                          )
                        ],
                      ));
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var ic_more = new Image(
        image: AssetImage('assets/ic_more.png'), height: 35, width: 50);

    var ic_notification= new Image(
        image: AssetImage('assets/ic_notification.png'), height: 35, width: 50);
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
                  const Text('Chào mừng đến',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  const Text('LearnHub',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0)),
                ],
              ),
              flexibleSpace: Image(
                  image: AssetImage('assets/ic_toolbar.png'),
                  fit: BoxFit.cover),
              actions: <Widget>[
                Stack(
                  children: <Widget>[
                    IconButton(
                        icon: ic_notification,
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
                PopupMenuButton<String>(
                  icon: ic_more,
                  itemBuilder: (BuildContext context) {
                    return listClasses.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                  onSelected: null,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                Visibility(child: AllClassesWidget(), visible: true),
              ],
            ),
          ),
        ));
  }
}
