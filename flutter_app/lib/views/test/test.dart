import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/views/classes/classes_detail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as prefix0;
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  String nextPage = "https://swapi.co/api/people";
//
//  ScrollController _scrollController = new ScrollController();
//
//  bool isLoading = false;
//
//  List names = new List();
//  final dio = new Dio();
//
//  void _getMoreData() async {
//    if (!isLoading) {
//      setState(() {
//        isLoading = true;
//      });
//
//      final response = await dio.get(nextPage);
//      print(response);
//      List tempList = new List();
//      nextPage = response.data['next'];
//      for (int i = 0; i < response.data['results'].length; i++) {
//        tempList.add(response.data['results'][i]);
//      }
//
//      setState(() {
//        isLoading = false;
//        names.addAll(tempList);
//      });
//    }
//  }

  List<ClassesModel> _listClasses = List<ClassesModel>();

  List<ClassesModel> parseClasses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    _listClasses = parsed
        .map<ClassesModel>((json) => ClassesModel.fromJson(json))
        .toList();
    return _listClasses.sublist(0, 4);
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

  Widget allClassesWidget() {
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
          return Container(
            height:  300,
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              itemCount: projectSnap?.data?.length ?? 0,
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
                          onLongPress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ClassesDetailPage();
                            }));
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              child: Stack(
                                children: <Widget>[
                                  Image(
                                      image:
                                          AssetImage('assets/logo_course.png')),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 180.0),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 8.0),
                                          Text('Kỹ năng quản lý thời gian',
                                              style: TextStyle(
                                                  color: Hexcolor('#FFFFFF'),
                                                  fontSize: 16.0,
                                                  fontWeight:
                                                      FontWeight.normal))
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: new Image(
                                                image: AssetImage(
                                                    'assets/ic_students.png'),
                                                color: Hexcolor('#FFFFFF'),
                                                height: 18,
                                                width: 25),
                                          ),
                                          Text('30 | ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Hexcolor('#FFFFFF'))),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 1.0),
                                            child: new Image(
                                                image: AssetImage(
                                                    'assets/ic_class.png'),
                                                color: Hexcolor('#FFFFFF'),
                                                height: 18.0,
                                                width: 25.0),
                                          ),
                                          Text('05 Lớp | ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Hexcolor('#FFFFFF'))),
                                          Container(
                                            child: new Image(
                                              image: AssetImage(
                                                  'assets/ic_time.png'),
                                              color: Hexcolor('#FFFFFF'),
                                              height: 18.0,
                                              width: 25.0,
                                            ),
                                          ),
                                          Text('7d 18h',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Hexcolor('#FFFFFF'))),
                                        ],
                                      ),
                                      SizedBox(height: 15.0),
                                      LinearPercentIndicator(
                                        width: 200.0,
                                        lineHeight: 2.0,
                                        percent: 0.75,
                                        backgroundColor: Hexcolor('#FFFFFF'),
                                        progressColor: Hexcolor('#E8943A'),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        )
                      ],
                    ));
              },
            ),
          );
        });
  }

  @override
  void initState() {
    // this._getMoreData();
    fetchClasses();
    super.initState();
//    _scrollController.addListener(() {
//      if (_scrollController.position.pixels ==
//          _scrollController.position.maxScrollExtent) {
//        _getMoreData();
//      }
//    });
  }

  @override
  void dispose() {
    //  _scrollController.dispose();
    super.dispose();
  }

//  Widget _buildProgressIndicator() {
//    return new Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: new Center(
//        child: new Opacity(
//          opacity: isLoading ? 1.0 : 00,
//          child: new CircularProgressIndicator(),
//        ),
//      ),
//    );
//  }

//  Widget _buildList() {
//    return ListView.builder(
////+1 for progressbar
//      itemCount: names.length + 1,
//      itemBuilder: (BuildContext context, int index) {
//        if (index == names.length) {
//          return _buildProgressIndicator();
//        } else {
//          return new ListTile(
//            title: Text((names[index]['name'])),
//            onTap: () {
//              print(names[index]);
//            },
//          );
//        }
//      },
//      controller: _scrollController,
//    );
//  }

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

  var currentListClasses = 'Tất cả các khoá học';

  void testSelect(String value) {
    if (value == "Tất cả các khoá học") {
      setState(() {
        a = true;
        b = true;
        c = true;
        d = true;
      });
    } else if (value == "khoá học của tôi") {
      setState(() {
        a = false;
        b = false;
        c = false;
        d = false;
      });
    }
  }

  Widget LearningWidget() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Image(
          image: AssetImage('assets/logo_learning.png'),
          height: 225.0,
        ),
        Column(
          children: <Widget>[
            Text('Lộ trình học tập ',
                style: TextStyle(
                    color: Hexcolor('#FFFFFF'),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    var assetsImage = new AssetImage('assets/open.png');
//    var image = new Image(image: assetsImage, width: 200.0, height: 200.0);

    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100),
//            Container(
//                padding: EdgeInsets.only(left: 20, right: 10),
//                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
//                height: MediaQuery.of(context).size.height / 15,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(30),
//                    color: Colors.grey[200]),
//                child: DropdownButtonHideUnderline(
//                    child: DropdownButton(
//                        value: currentListClasses,
//                        isExpanded: true,
//                        hint: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text('Tất cả khoá học')),
//                        items: listClasses.map((String value) {
//                          return new DropdownMenuItem<String>(
//                              child: new Text(value), value: value);
//                        }).toList(),
//                        onChanged: (String value) {
//                          setState(() {
//                            this.currentListClasses = value;
//                            testSelect(value);
//                            print(value);
//                          });
//                        }))),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('Tất cả các khoá học'), visible: true),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('khoá học của tôi'), visible: true),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('lộ trình học tập'), visible: true),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('đề thi'), visible: true),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('lịch học sắp tới'), visible: true),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('kết quả học tập'), visible: true),
//            SizedBox(height: 20.0),
//            Visibility(child: Text('họp trực tuyến'), visible: true),
//            SizedBox(height: 20.0),
//            Container(
//              width: double.infinity,
//              height: 250,
//              child: Card(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(15.0)),
//                color: Colors.white,
//                elevation: 10,
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    const ListTile(
//                      leading: Icon(Icons.album, size: 70),
//                      title: Text('Heart Shaker',
//                          style: TextStyle(color: Colors.black)),
//                      subtitle:
//                          Text('TWICE', style: TextStyle(color: Colors.black)),
//                    ),
//                    InkWell(
//                      onTap: () {
////                        Navigator.of(context)
////                            .push(MaterialPageRoute(builder: (context) {
////
////                        }));
//                      },
//                      child: new Container(
//                        height: 45,
//                        width: MediaQuery.of(context).size.width / 3,
//                        decoration: BoxDecoration(
//                            gradient: LinearGradient(
//                              colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
//                            ),
//                            borderRadius:
//                                BorderRadius.all(Radius.circular(50))),
//                        child: Center(
//                          child: Text(
//                            'Đăng ký'.toUpperCase(),
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//            Container(
//              height: 120.0,
//              color: Colors.transparent,
//              child: ListView.builder(
//                  scrollDirection: Axis.horizontal,
//                  itemCount: 3,
//                  itemBuilder: (BuildContext context, int index) {
//                    return GestureDetector(
//                        onTap: () {
////                          _onItemTapped(index);
//                        },
//                        child: Stack(
//                          children: <Widget>[
//                            Positioned.fill(child: image),
//                            Container(
//                                width: 200,
//                                height: 40.0,
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      'Hello World',
//                                      style: TextStyle(
//                                          color: Colors.red,
//                                          fontSize: 12,
//                                          fontWeight: FontWeight.bold,
//                                          letterSpacing: 1),
//                                    ),
//                                  ],
//                                ))
//                          ],
//                        ));
//                  }),
//            ),
            allClassesWidget(),
          ],
        ),
      )),
      resizeToAvoidBottomPadding: true,
    );
  }
}
