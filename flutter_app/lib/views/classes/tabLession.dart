import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/service/Webservice.dart';

class TabLessionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TabLessionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabLessionPage extends StatefulWidget {
  @override
  TabLessionState createState() {
    // TODO: implement createState
    return TabLessionState();
  }
}

class TabLessionState extends State<TabLessionPage> {
  List<ClassesModel> _listClasses = List<ClassesModel>();

  Future _getClasses() {
    Webservice().load(ClassesModel.all).then((classesModel) => {
          setState(() {
            _listClasses = classesModel;
            print("bai giang " + _listClasses[0].avatar);
          })
        });
  }
  List<ClassesModel> parseClasses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ClassesModel>((json) => ClassesModel.fromJson(json))
        .toList();
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
          return ListView.builder(
            shrinkWrap: true,
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
                    children: <Widget>[
                      Center(
                        child: Image.network(project.avatar,
                            height: 120, width: 120),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Column(
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 25.0, right: 25.0)),
                                Container(
                                  child: Icon(Icons.closed_caption),
                                ),
                                Text('07 ngày 18 giờ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: projectWidget(),
    );
  }
}
