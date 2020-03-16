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
            print("bai giang " +_listClasses[0].avatar);
          })
        });
  }

  //futurebuilder
//  Widget projectWidget() {
//    return FutureBuilder(
//      builder: (context, projectSnap) {
//        if (projectSnap.connectionState == ConnectionState.none &&
//            projectSnap.hasData == null) {
//          //print('project snapshot data is: ${projectSnap.data}');
//          return Container();
//        } else {
//              return Column(
//                children: <Widget>[
//                  Padding(
//                    padding:
//                        EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
//                    child: Align(
//                      alignment: Alignment.centerLeft,
//                      child: Text(
//                        'Kỹ năng quản lý',
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 18.00),
//                      ),
//                    ),
//                  ),
//                  ListView.builder(
//                    padding: EdgeInsets.only(top: 8.0),
//                    itemBuilder: (context, index) {
//                      ClassesModel project = projectSnap.data[index];
//                      return Padding(
//                          padding: EdgeInsets.symmetric(
//                            horizontal: 16.0,
//                            vertical: 8.0,
//                          ),
//                          child: Row(
//                            children: <Widget>[
//                              Center(
//                                child:
//                                    Image.network(project.avatar, height: 120, width: 120),
//                              ),
//                              Container(
//                                margin: const EdgeInsets.only(bottom: 10.0),
//                                child: Column(
//                                  children: <Widget>[
//                                    Row(
//                                      children: <Widget>[
//                                        Text('Kỹ năng quản lý thời gian',
//                                            style:
//                                                TextStyle(color: Colors.black))
//                                      ],
//                                    ),
//                                    SizedBox(height: 10.0),
//                                    Row(
//                                      children: <Widget>[
//                                        Container(
//                                          child: Icon(Icons.person),
//                                        ),
//                                        Text('30M',
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.bold))
//                                      ],
//                                    ),
//                                    SizedBox(height: 10.0),
//                                    Row(
//                                      children: <Widget>[
//                                        Container(
//                                          margin: const EdgeInsets.only(
//                                              bottom: 8.0),
//                                          child: Icon(Icons.home),
//                                        ),
//                                        Text('05 Lớp',
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.bold)),
//                                        Container(
//                                            margin: const EdgeInsets.only(
//                                                left: 25.0, right: 25.0)),
//                                        Container(
//                                          child: Icon(Icons.closed_caption),
//                                        ),
//                                        Text('07 ngày 18 giờ',
//                                            style: TextStyle(
//                                                fontWeight: FontWeight.bold)),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              )
//                            ],
//                          ));
//                    },
//                    itemCount: 1,
//                    shrinkWrap: true,
//                    // todo comment this out and check the result
//                    physics:
//                        ClampingScrollPhysics(), // todo comment this out and check the result
//                  ),
//                ],
//              );
//            },
//          );
//        }
//      },
//      future: _getClasses(),
//    );
//  }

Widget projectWidget() {
  return FutureBuilder(
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        return  GestureDetector(
          child: Center(
            child: Image.network("https://dzbbmecpa0hd2.cloudfront.net/video/avatar/2019/04/11/14/1554966002_de58c8a6be7d1046.jpg",
                height: 120, width: 120),
          ),
        );
      }
      return ListView.builder(
        itemCount: projectSnap?.data?.length ?? 0,
        itemBuilder: (context, index) {
          ClassesModel project = projectSnap?.data[index];
          print("      " +project.avatar);
          return Column(
            children: <Widget>[
              // Widget to display the list of project
              GestureDetector(
                child: Center(
                  child: Image.network(project?.avatar,
                      height: 120, width: 120),
                ),
              ),
            ],

          );
        },
      );
    },
    future: _getClasses(),
  );
}


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: projectWidget(),
    );
  }
}
