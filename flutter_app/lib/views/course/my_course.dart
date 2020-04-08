import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as prefix0;
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyCoursePage extends StatefulWidget {
  @override
  MyCourseState createState() {
    // TODO: implement createState
    return MyCourseState();
  }
}

class MyCourseState extends State<MyCoursePage> {
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
                  return Card(
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0)),
                    color: Hexcolor('#FFFFFF'),
                    elevation: 2,
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage('assets/logo_class.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                                SizedBox(width: 20.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Kỹ năng quản lý thời gian',
                                        style: TextStyle(
                                            color: Hexcolor('#212121'),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 6.0),
                                    Row(
                                      children: <Widget>[
                                        Text('Lớp K12  | ',
                                            style: TextStyle(
                                                color: Hexcolor('#E8943A'),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal)),
                                        Text('Trạng thái : Active ',
                                            style: TextStyle(
                                                color: Hexcolor('#E8943A'),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal))
                                      ],
                                    ),
                                    SizedBox(height: 6.0),
                                    LinearPercentIndicator(
                                      width: 200.0,
                                      lineHeight: 3.0,
                                      percent: 0.5,
                                      backgroundColor: Hexcolor('#e7e7e7'),
                                      progressColor: Hexcolor('#AA3234'),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Image(image: AssetImage('assets/ic_line_big.png')),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Giảng viên ',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.normal)),
                                    SizedBox(height: 8.0),
                                    Text('Nguyễn Huy Anh ',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.bold)),
                                    SizedBox(height: 13.0),
                                    Text('Ngày bắt đầu',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.normal)),
                                    SizedBox(height: 7.0),
                                    Text('01/03/2020',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(width: 40.0),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Chứng chỉ ',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.normal)),
                                    SizedBox(height: 8.0),
                                    Text('Chưa có',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.bold)),
                                    SizedBox(height: 13.0),
                                    Text('Ngày kết thúc',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.normal)),
                                    SizedBox(height: 7.0),
                                    Text('03/03/2020',style: TextStyle(color: Hexcolor('#111111'),fontSize: 16.0,fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
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
  Widget build(BuildContext context) {
    var ic_notification = new Image(
        image: AssetImage('assets/ic_notification.png'), height: 35, width: 50);
    // TODO: implement build
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Hexcolor('F5f6f9'),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
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
                  const Text('Khoá học của tôi',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
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
              ],
            ),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: myCourseWidget(),
          ),
        ),
      ),
    );
  }
}
