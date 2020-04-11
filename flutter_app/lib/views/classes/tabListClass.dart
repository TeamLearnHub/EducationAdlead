import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as prefix0;

class TabListClassPage extends StatefulWidget {
  @override
  TabListClassState createState() {
    // TODO: implement createState
    return TabListClassState();
  }
}

class TabListClassState extends State<TabListClassPage> {
  void showDialogConfirm(BuildContext context) {
    Dialog confirmDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Xin chào!',
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        'Bạn có chắc chắn muốn đăng ký khoá học này ? ',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Chắc chắn',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Huỷ',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => confirmDialog);
  }

  var listClasses = [
    'Tất cả khoá học',
    'Kỹ năng quản lý',
    'Kỹ năng mềm',
    'Khoá học Offline',
    'Quy trình nghiệp vụ',
  ];

  var currentListClasses = 'Tất cả khoá học';

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
  Widget listClassWidget() {
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    var ic_dropdow = new Image(
        image: AssetImage('assets/ic_dropdow.png'), height: 35, width: 50);
    // TODO: implement build
    return Scaffold(
        backgroundColor: Hexcolor('f5f6f9'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height / 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Hexcolor('#FFFFFF')),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          icon: ic_dropdow,
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

            ],
          ),
        ));
  }
}
