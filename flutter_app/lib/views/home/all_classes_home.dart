import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/util/color.dart';
import 'package:flutter_app/views/classes/classes_detail.dart';
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

  var listClasses = [
    'Tất cả khoá học',
    'Kỹ năng quản lý',
    'Kỹ năng mềm',
    'Khoá học Offline',
    'Quy trình nghiệp vụ',
  ];

  var currentListClasses = 'Tất cả khoá học';

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
            Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                height: MediaQuery.of(context).size.height / 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Hexcolor('#F5F6F9')),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: currentListClasses,
                        isExpanded: true,
                        hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Tất cả khoá học')),
                        items: listClasses.map((String value) {
                          return new DropdownMenuItem<String>(
                              child: new Text(value), value: value);
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            this.currentListClasses = value;
//                            testSelect(value);
                            print(value);
                          });
                        }))),
            SizedBox(height: 20.0),
            Image(image: AssetImage('assets/ic_line_big.png')),
            allClassesWidget(),
          ],
        ),
      ),
    );
  }
}
