import 'dart:convert';
import 'package:http/http.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:hexcolor/hexcolor.dart';

import 'classes_detail.dart';

class TabIntroductionPage extends StatefulWidget {
  @override
  _TabIntroductionState createState() {
    // TODO: implement createState
    return _TabIntroductionState();
  }
}

class _TabIntroductionState extends State<TabIntroductionPage> {
  bool monVal = false;

  bool isChecked = false;

  var resultHolder = 'Checkbox is UN-CHECKED';

  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
        print(resultHolder);
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
        print(resultHolder);
      });
    }
  }

  List<ClassesModel> _listClasses = List<ClassesModel>();

  List<ClassesModel> parseClasses(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    _listClasses = parsed
        .map<ClassesModel>((json) => ClassesModel.fromJson(json))
        .toList();
    return _listClasses.sublist(0, 5);
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
              Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Align(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Các khoá học khác ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.00),
                    ),
                    SizedBox(width: 105.0),
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
                                return ClassesDetailPage(classesModel: project);
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
                                return ClassesDetailPage(classesModel: project);
                              }));
                            },
                            onLongPress: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ClassesDetailPage(classesModel: project);
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget introductionWidget() {
    return Card(
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        color: Hexcolor('#FFFFFF'),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Text('Bạn sẽ nhận được gì từ khoá học',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Text('Sắp xếp thời gian làm việc khoa học',
                      style: TextStyle(color: Colors.black, fontSize: 16.5)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Text('Quản lý thời gian làm việc của bản thân',
                      maxLines: 2,
                      style: TextStyle(color: Colors.black, fontSize: 16.5)),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Text('Sắp xếp thời gian làm việc cho nhân sự',
                      maxLines: 2,
                      style: TextStyle(color: Colors.black, fontSize: 16.5)),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Text('quản lý thời gian làm việc của bản thân',
                      maxLines: 2,
                      style: TextStyle(color: Colors.black, fontSize: 16.5)),
                ],
              ),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Text('Bạn cần làm gì để đạt được mục tiêu ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Text('Thực hiện theo đúng lộ trình học tập',
                      maxLines: 2,
                      style: TextStyle(color: Colors.black, fontSize: 16.5)),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Image(image: AssetImage('assets/ic_checkbox.png')),
                  SizedBox(width: 5.0),
                  Text('Hoàn thành đầy đủ các bài kiểm tra',
                      maxLines: 2,
                      style: TextStyle(color: Colors.black, fontSize: 16.5)),
                ],
              ),
              SizedBox(height: 30.0)
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              introductionWidget(),
              SizedBox(height: 15.0),
              Container(
                margin: const EdgeInsets.only(
                    left: 25.0, right: 10.0),
                child: Image(image: AssetImage('assets/ic_line_big.png')),
              ),
              SizedBox(height: 15.0),
              allClassesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
