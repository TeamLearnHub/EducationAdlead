import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/views/classes/classes_detail.dart';
import 'package:flutter_app/views/course/my_course.dart';
import 'package:flutter_app/views/course/my_course_home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as prefix0;
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'all_classes_home.dart';

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

  Widget myCourseWidget() {
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
            height: 290.0,
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
                      horizontal: 2.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 8.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MyCoursePage();
                            }));
                          },
                          onLongPress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MyCoursePage();
                            }));
                          },
                          child: Container(
                              height: 270.0,
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

  Widget LearningWidget() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Image(
          image: AssetImage('assets/logo_learning.png'),
          height: 225.0,
          width: double.maxFinite,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Lộ trình học tập ',
                style: TextStyle(
                    color: Hexcolor('#FFFFFF'),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            SizedBox(width: 20.0)
          ],
        )
      ],
    );
  }

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
                                      SizedBox(width: 6.0),
                                      Text('Kỹ năng quản lý thời gian',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold))
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
                                            height: 18,
                                            width: 25),
                                      ),
                                      Text('30M | ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Hexcolor('#787878'))),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 1.0),
                                        child: new Image(
                                            image: AssetImage(
                                                'assets/ic_class.png'),
                                            height: 18.0,
                                            width: 25.0),
                                      ),
                                      Text('05 Lớp | ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Hexcolor('#787878'))),
                                      Container(
                                        child: new Image(
                                          image:
                                              AssetImage('assets/ic_time.png'),
                                          height: 18.0,
                                          width: 25.0,
                                        ),
                                      ),
                                      Text('07 ngày',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 5.0,
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

  Widget scheduleWidget() {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Align(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Lịch học sắp tới',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.00),
                    ),
                    SizedBox(width: 135.0),
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
                              constraints: BoxConstraints(maxWidth: 225),
                              margin:
                                  const EdgeInsets.only(top: 35.0, left: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Wrap(
                                    alignment: WrapAlignment.end,
                                    children: <Widget>[
                                      SizedBox(width: 6.0),
                                      Text(
                                          'Bồi dưỡng kỹ năng chăm sóc khách hàng',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: new Image(
                                          image:
                                              AssetImage('assets/ic_time.png'),
                                          height: 18.0,
                                          width: 25.0,
                                        ),
                                      ),
                                      Text('15/06/2020',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                  SizedBox(height: 25.0),
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
    fetchClasses();
  }

  void choice(String choice) {
    if (choice == "khoá học của tôi") {
      setState(() {
        print(choice);
        a = false;
      });
    } else if (choice == "Tất cả các khoá học") {
      setState(() {
        print(choice);
        a = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ic_more = new Image(
        image: AssetImage('assets/ic_more.png'), height: 35, width: 50);

    var ic_notification = new Image(
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
                  onSelected: choice,
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
                Visibility(child: AllClassesWidget(), visible: a),
                SizedBox(height: 20.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Align(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Khoá học của tôi',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.00),
                      ),
                      SizedBox(width: 145.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyCourseHomePage();
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
                Visibility(child: myCourseWidget(), visible: true),
                SizedBox(height: 20.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
                Visibility(child: LearningWidget(), visible: true),
                SizedBox(height: 20.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
                Visibility(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 20.0),
                                Image(
                                    image: AssetImage('assets/logo_exam.png')),
                                SizedBox(width: 18.0),
                                Text('Đề thi',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Hexcolor('#434343'),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 245.0),
                                Image(image: AssetImage('assets/ic_next.png'))
                              ],
                            ),
                          ))
                    ],
                  ),
                  visible: true,
                ),
                SizedBox(height: 15.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
                Visibility(child: scheduleWidget(), visible: true),
                SizedBox(height: 15.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
                Visibility(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 20.0),
                                Image(
                                    image:
                                        AssetImage('assets/logo_result.png')),
                                SizedBox(width: 18.0),
                                Text('Kết quả học tập',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Hexcolor('#434343'),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 160.0),
                                Image(image: AssetImage('assets/ic_next.png'))
                              ],
                            ),
                          ))
                    ],
                  ),
                  visible: true,
                ),
                SizedBox(height: 15.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
                Visibility(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 20.0),
                                Image(
                                    image:
                                        AssetImage('assets/logo_meeting.png')),
                                SizedBox(width: 18.0),
                                Text('Họp trực tuyến',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Hexcolor('#434343'),
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 160.0),
                                Image(image: AssetImage('assets/ic_next.png'))
                              ],
                            ),
                          ))
                    ],
                  ),
                  visible: true,
                ),
                SizedBox(height: 15.0),
                Image(image: AssetImage('assets/ic_line_big.png')),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ));
  }
}
