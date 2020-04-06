import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/views/classes/classes_detail.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as prefix0;

class AllClassesHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllClassesHomePage(),
    );
  }
}

class AllClassesHomePage extends StatefulWidget {
  @override
  AllClassesHomeState createState() {
    // TODO: implement createState
    return AllClassesHomeState();
  }
}

class AllClassesHomeState extends State<AllClassesHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          return Column(
            children: <Widget>[
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
                                  )
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
  Widget build(BuildContext context) {
    var ic_close = new Image(
        image: AssetImage('assets/ic_close.png'), height: 35, width: 50);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Hexcolor('#FFFFFF'),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Tất cả khoá học',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
            ],
          ),
          actions: <Widget>[
            IconButton(
                icon: ic_close,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        preferredSize: Size.fromHeight(60.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            allClassesWidget(),
          ],
        ),
      ),
    );
  }
}
