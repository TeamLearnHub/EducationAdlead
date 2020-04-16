import 'package:custom_chewie/custom_chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

import 'my_course_detail_tab.dart';

class MyCourseDetailPage extends StatefulWidget {
  final ClassesModel classesModel;

  MyCourseDetailPage({Key key, @required this.classesModel}) : super(key: key);

  @override
  MyCourseDetailState createState() {
    // TODO: implement createState
    return MyCourseDetailState(classesModel);
  }
}

class MyCourseDetailState extends State<MyCourseDetailPage> {
  ClassesModel classesModel;

  MyCourseDetailState(this.classesModel);

  final playerWidget = new Chewie(
    VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    aspectRatio: 3 / 2,
    autoPlay: false,
    looping: true,
    showControls: true,
  );

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerWidget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            playerWidget,
            SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(top: 15.0, left: 27.0),
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
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Container(
                        child: new Image(
                            image: AssetImage('assets/ic_students.png'),
                            height: 18,
                            width: 25),
                      ),
                      Text('30M | ',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Hexcolor('#787878'))),
                      Container(
                        margin: const EdgeInsets.only(bottom: 1.0),
                        child: new Image(
                            image: AssetImage('assets/ic_class.png'),
                            height: 18.0,
                            width: 25.0),
                      ),
                      Text('05 Lớp | ',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Hexcolor('#787878'))),
                      Container(
                        child: new Image(
                          image: AssetImage('assets/ic_time.png'),
                          height: 18.0,
                          width: 25.0,
                        ),
                      ),
                      Text('07 ngày',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                    ],
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Image(image: AssetImage('assets/ic_line_big.png')),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Giảng viên ',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal)),
                    SizedBox(height: 8.0),
                    Text('Nguyễn Huy Anh ',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 13.0),
                    Text('Ngày bắt đầu',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal)),
                    SizedBox(height: 7.0),
                    Text('01/03/2020',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(width: 40.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lớp',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal)),
                    SizedBox(height: 8.0),
                    Text('K12',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 13.0),
                    Text('Ngày kết thúc',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal)),
                    SizedBox(height: 7.0),
                    Text('03/03/2020',
                        style: TextStyle(
                            color: Hexcolor('#111111'),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
            SizedBox(height: 210.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return CourseDetailTabPage();
                  }));
                },
                child: new Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 0.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Hexcolor('#FAA244'), Hexcolor('#FF8400')],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  child: Center(
                    child: Text(
                      'bắt đầu ngay'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
