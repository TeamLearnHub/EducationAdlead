import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabRegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabRegisterPage(),
    );
  }
}

class TabRegisterPage extends StatefulWidget {
  @override
  TabRegisterState createState() {
    // TODO: implement createState
    return TabRegisterState();
  }
}

class TabRegisterState extends State<TabRegisterPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          Text('1. TÊN KHOÁ HỌC',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          Text('KỸ NĂNG QUẢN LÝ THỜI GIAN',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          Text('2. DANH SÁCH LỚP HỌC CHI TIẾT',
              style: TextStyle(color: Colors.black, fontSize: 18)),
          ListView.builder(
            padding: EdgeInsets.only(top: 8.0),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(Icons.home),
                                      ),
                                      Text('Lớp 01',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Row(
                                    children: <Widget>[
                                      Text('Mã lớp : 0001',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(width: 15.0),
                                  Row(
                                    children: <Widget>[
                                      Text('Loại hình đào tạo : Online',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        child: Icon(Icons.person),
                                      ),
                                      Text('GV : Lê Bảo Châu ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(width: 30.0),
                                  Text('Số lượng : 12/30 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Wrap(
                                alignment: WrapAlignment.end,
                                children: <Widget>[
                                  Wrap(
                                    alignment: WrapAlignment.end,
                                    spacing: 10.0,
                                    children: <Widget>[
                                      Text('Ngày bắt đầu : 01/03/2020',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Ngày kết thúc : 01/03/2020',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 150.0, right: 150.0),
                                child: FlatButton(
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    disabledColor: Colors.grey,
                                    disabledTextColor: Colors.black,
                                    padding: EdgeInsets.all(8.0),
                                    splashColor: Colors.blueAccent,
                                    onPressed: null,
                                    child: Text('Đăng ký')),
                              )
                            ],
                          ),
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
      ),
    ));
  }
}
