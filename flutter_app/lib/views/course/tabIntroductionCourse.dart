import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TabIntroductionCoursePage extends StatefulWidget {
  @override
  TabIntroductionState createState() {
    // TODO: implement createState
    return TabIntroductionState();
  }
}

class TabIntroductionState extends State<TabIntroductionCoursePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget contentWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Tất quan khoá học',
                style: TextStyle(
                    color: Hexcolor('#212121'),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.00),
              ),
              SizedBox(width: 60.0),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 100),
                    child: Text(
                      'Xem thêm'.toUpperCase(),
                      style: TextStyle(
                        color: Hexcolor('#AA3234'),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.00,
                      ),
                    ),
                  ))
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
                'Toán học được sử dụng trên khắp thế giới như một công cụ thiết yếu trong nhiều lĩnh vực, bao gồm khoa học, kỹ thuật, y học, và tài chính. Toán học ứng dụng, một nhánh toán học liên quan đến việc ứng dụng kiến thức toán học vào những lĩnh vực khác, thúc đẩy và sử dụng những phát minh toán học mới, từ đó đã dẫn đến việc phát triển nên những ngành toán hoàn toàn mới, chẳng hạn như thống kê và lý thuyết trò chơi.',
                style: TextStyle(
                    color: Hexcolor('#212121'),
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.center),
          ),
        )
      ],
    );
  }

  Widget teacherWidget() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Giảng viên',
                  style: TextStyle(
                      color: Hexcolor('#212121'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 0.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Họ tên',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 105),
                  Text('Nguyễn Huy Anh',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 0.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Trình độ',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 165),
                  Text('Thạc sĩ',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 1.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Tuổi',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 235),
                  Text('30',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 1.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Đánh giá',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 75),
                  RatingBar(
                    initialRating: 5,
                    minRating: 1,
                    itemSize: 30,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Hexcolor('#AA3234'),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              )),
        ),
        SizedBox(height: 10.0),
        Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image(image: AssetImage('assets/ic_line_big.png')),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget documentWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Tài liệu tham khảo',
                  style: TextStyle(
                      color: Hexcolor('#212121'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 6.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              margin: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Văn hoá làm việc tập thể tại các công sở',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 0.0),
                  Image(image: AssetImage('assets/ic_download.png'))
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 6.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              margin: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Văn hoá làm việc tập thể tại các công sở',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 0.0),
                  Image(image: AssetImage('assets/ic_download.png'))
                ],
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 6.0, right: 1.0),
          child: Container(
              constraints: BoxConstraints(maxWidth: 400),
              margin: const EdgeInsets.all(10.0),
              child: Wrap(
                children: <Widget>[
                  Text('Văn hoá làm việc tập thể tại các công sở',
                      style: TextStyle(
                          color: Hexcolor('#212121'),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal)),
                  SizedBox(width: 0.0),
                  Image(image: AssetImage('assets/ic_download.png'))
                ],
              )),
        ),
      ],
    );
  }

  Widget finishWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Điều kiện hoàn thành',
                  style: TextStyle(
                      color: Hexcolor('#212121'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Align(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Học tập theo đúng lộ trình',
                  style: TextStyle(
                      color: Hexcolor('#212121'),
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal)),
            ],
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 16.0),
          child: Align(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Text('Hoàn thành đầy đủ các bài học và các bài kiểm tra',
                  style: TextStyle(
                      color: Hexcolor('#212121'),
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(left: 25.0, right: 10.0),
            child: Image(image: AssetImage('assets/ic_line_big.png')),
          ),
          SizedBox(height: 10.0),
          contentWidget(),
          SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(left: 25.0, right: 10.0),
            child: Image(image: AssetImage('assets/ic_line_big.png')),
          ),
          SizedBox(height: 10.0),
          teacherWidget(),
          SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(left: 25.0, right: 10.0),
            child: Image(image: AssetImage('assets/ic_line_big.png')),
          ),
          SizedBox(height: 10.0),
          documentWidget(),
          SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.only(left: 25.0, right: 10.0),
            child: Image(image: AssetImage('assets/ic_line_big.png')),
          ),
          SizedBox(height: 10.0),
          finishWidget()
        ],
      ),
    );
  }
}
