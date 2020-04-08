import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/service/Webservice.dart';
import 'package:flutter_app/views/classes/classes_detail.dart';

class ClassesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassesPage(),
    );
  }
}

Widget _buildListItem1() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Kỹ năng mềm',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.00),
          ),
        ),
      ),
      ListView.builder(
        padding: EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: <Widget>[
                  Center(
                    child: Image.network(
                        "https://i.picsum.photos/id/9/250/250.jpg",
                        height: 120,
                        width: 120),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
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
                        Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.person),
                            ),
                            Text('30M',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(Icons.home),
                            ),
                            Text('05 Lớp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 25.0, right: 25.0)),
                            Container(
                              child: Icon(Icons.closed_caption),
                            ),
                            Text('07 ngày 18 giờ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
        itemCount: 4,
        shrinkWrap: true,
        // todo comment this out and check the result
        physics:
            ClampingScrollPhysics(), // todo comment this out and check the result
      ),
    ],
  );
}

Widget _buildListItem2() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Khoá học Offline',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.00),
          ),
        ),
      ),
      ListView.builder(
        padding: EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: <Widget>[
                  Center(
                    child: Image.network(
                        "https://i.picsum.photos/id/9/250/250.jpg",
                        height: 120,
                        width: 120),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
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
                        Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.person),
                            ),
                            Text('30M',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(Icons.home),
                            ),
                            Text('05 Lớp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                              child: Icon(Icons.closed_caption),
                            ),
                            Text('07 ngày 18 giờ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
        itemCount: 4,
        shrinkWrap: true,
        // todo comment this out and check the result
        physics:
            ClampingScrollPhysics(), // todo comment this out and check the result
      ),
    ],
  );
}

Widget _buildListItem3() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Quy trình nghiệp vụ',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.00),
          ),
        ),
      ),
      ListView.builder(
        padding: EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: <Widget>[
                  Center(
                    child: Image.network(
                        "https://i.picsum.photos/id/9/250/250.jpg",
                        height: 120,
                        width: 120),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
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
                        Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.person),
                            ),
                            Text('30M',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(Icons.home),
                            ),
                            Text('05 Lớp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 25.0, right: 25.0)),
                            Container(
                              child: Icon(Icons.closed_caption),
                            ),
                            Text('07 ngày 18 giờ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
        itemCount: 4,
        shrinkWrap: true,
        // todo comment this out and check the result
        physics:
            ClampingScrollPhysics(), // todo comment this out and check the result
      ),
    ],
  );
}

class ClassesPage extends StatefulWidget {
  @override
  ClassesPageState createState() {
    // TODO: implement createState
    return ClassesPageState();
  }
}

class PopupMenu {
  static const all = "Tất cả";
  static const dkm = "Kỹ năng quản lý";
  static const dccc = "Kỹ năng mềm";
  static const cccc = "Khoá học Offline";
  static const cccd = "Quy trình nghiệp vụ";
  static const List<String> popup = <String>[all, dkm, dccc, cccc, cccd];
}

class ClassesPageState extends State<ClassesPage> {
  bool visibilitydkm = true;
  bool visibilitydccc = true;
  bool visibilitycccc = true;
  bool visibilitycccd = true;

  void choice(String choice) {
    if (choice == PopupMenu.all) {
      setState(() {
        print(PopupMenu.all);
        visibilitydkm = true;
        visibilitydccc = true;
        visibilitycccc = true;
        visibilitycccd = true;
      });
    } else if (choice == PopupMenu.dkm) {
      setState(() {
        print(PopupMenu.dkm);
        visibilitydkm = true;
        visibilitydccc = false;
        visibilitycccc = false;
        visibilitycccd = false;
      });
    } else if (choice == PopupMenu.dccc) {
      setState(() {
        print(PopupMenu.dccc);
        visibilitydkm = false;
        visibilitydccc = true;
        visibilitycccc = false;
        visibilitycccd = false;
      });
    } else if (choice == PopupMenu.cccc) {
      setState(() {
        print(PopupMenu.cccc);
        visibilitydkm = false;
        visibilitydccc = false;
        visibilitycccc = true;
        visibilitycccd = false;
      });
    } else if (choice == PopupMenu.cccd) {
      setState(() {
        print(PopupMenu.cccd);
        visibilitydkm = false;
        visibilitydccc = false;
        visibilitycccc = false;
        visibilitycccd = true;
      });
    }
  }

  Widget _buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Visibility(child: projectWidget(), visible: visibilitydkm),
            Visibility(child: _buildListItem1(), visible: visibilitydccc),
            Visibility(child: _buildListItem2(), visible: visibilitycccc),
            Visibility(child: _buildListItem3(), visible: visibilitycccd),
          ]),
        )
      ],
    );
  }

  List<ClassesModel> _listClasses = List<ClassesModel>();

  _getClasses() {
    Webservice().load(ClassesModel.all).then((classesModel) => {
          setState(() {
            _listClasses = classesModel;
          })
        });
  }

  List<ClassesModel> parseClasses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    _listClasses = parsed
        .map<ClassesModel>((json) => ClassesModel.fromJson(json))
        .toList();
    return _listClasses;
  }

  Future<List<ClassesModel>> fetchClasses() async {
    final response =
        await http.get('http://demo4855049.mockable.io/gethotvideo');
    if (response.statusCode == 200) {
      return parseClasses(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  Widget projectWidget() {
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
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          'Kỹ năng quản lý ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.00),
                        ),
                        SizedBox(width: 150.0),
                        Text(
                          'Xem thêm',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.00,
                          ),
                        ),
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
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                    color: Colors.white,
                    elevation: 2,
                    child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ClassesDetailApp();
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
                                  return ClassesDetailApp();
                                }));
                              },
                              onLongPress: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ClassesDetailApp();
                                }));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 15.0, left: 12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('Kỹ năng quản lý thời gian',
                                            style:
                                                TextStyle(color: Colors.black))
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
                                          margin: const EdgeInsets.only(
                                              bottom: 1.0),
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
                                          height: 30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFf45d27),
                                                  Color(0xFFf5851f)
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
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
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
    _getClasses();
    fetchClasses();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Hexcolor('F5f6f9'),
            appBar: AppBar(
              backgroundColor: Color(0xFFfbe3ee),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 23,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context)),
              title: Container(
                padding: EdgeInsets.only(right: 35),
                alignment: Alignment.center,
                child: Text("Tất cả các khoá học"),
              ),
              actions: <Widget>[
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black87,
                  ),
                  itemBuilder: (BuildContext context) {
                    return PopupMenu.popup.map((String choice) {
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
            body: _buildMainContent()));
  }
}
