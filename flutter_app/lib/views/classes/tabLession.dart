import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/classes_model.dart';

import 'classes_detail.dart';

class TabLessionPage extends StatefulWidget {
  @override
  TabLessionState createState() {
    // TODO: implement createState
    return TabLessionState();
  }
}

class TabLessionState extends State<TabLessionPage> {
  List<ClassesModel> _listClasses = List<ClassesModel>();

  List<ClassesModel> parseClasses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    _listClasses = parsed
        .map<ClassesModel>((json) => ClassesModel.fromJson(json))
        .toList();
    return _listClasses.sublist(0, 3);
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

  Widget listLessionWidget() {
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
          return Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            color: Hexcolor('#FFFFFF'),
            elevation: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(maxWidth: 355),
                  margin:
                  const EdgeInsets.only(top: 15.0, left: 10.0),
                  child: Text(
                    'Bài 1 : Sắp xếp thời gian làm việc khoa học',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.00),
                  ),
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
                      padding: const EdgeInsets.all(10.0),
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
                                  height: 130, width: 115),
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
                                  Container(
                                    constraints: BoxConstraints(maxWidth: 205),
                                    child: Text(
                                        'Vì sao phải sắp xếp thời gian làm việc khoa học',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold)),
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
                      ),
                    );
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[listLessionWidget()],
        ),
      ),
    );
  }
}
