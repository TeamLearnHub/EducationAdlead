import 'package:custom_chewie/custom_chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/views/classes/tabLession.dart';
import 'package:flutter_app/views/comment/comment_view.dart';
import 'package:flutter_app/views/course/tabIntroductionCourse.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

class CourseDetailTabPage extends StatefulWidget {
  @override
  CourseDetailTabState createState() {
    // TODO: implement createState
    return CourseDetailTabState();
  }
}

class CourseDetailTabState extends State<CourseDetailTabPage> {
  int _indexSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerWidget.controller.addListener(() {
      if (playerWidget.controller.value.position ==
          playerWidget.controller.value.position) {
        print('video ended');
//        SchedulerBinding.instance.addPostFrameCallback((_) {
//          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//            return MyAppTab();
//          }));
//        });
      }
    });
  }

  final playerWidget = new Chewie(
    VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    aspectRatio: 3 / 2,
    autoPlay: true,
    looping: true,
    showControls: true,
  );

  TabController controller;
  final List<String> option = [
    'giới thiệu'.toUpperCase(),
    'thảo luận'.toUpperCase(),
    'câu hỏi cho gv'.toUpperCase(),
  ];
  final List<Icons> icons = [];

  final _pageoption = [
    TabIntroductionCoursePage(),
    CommentPage(),
    TabLessionPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  Widget titleClassesDetail() {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(left: 5.0),
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
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal))
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
                        Text('07d 18h',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Hexcolor('#787878'))),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Hexcolor('f5f6f9'),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    playerWidget,
                  ],
                ),
                SizedBox(height: 15.0),
                titleClassesDetail(),
                SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Image(image: AssetImage('assets/ic_line_big.png')),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 40.0,
                  color: Hexcolor('f5f6f9'),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: option.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              _onItemTapped(index);
                            },
                            child: Container(
                                width: 142,
                                color: index == _indexSelected
                                    ? Hexcolor('f5f6f9')
                                    : Hexcolor('f5f6f9'),
                                height: 40.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      option[index],
                                      style: TextStyle(
                                          color: index == _indexSelected
                                              ? Hexcolor('#AA3234')
                                              : Hexcolor('#111111'),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                )));
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  height: 525,
                  child: _pageoption[_indexSelected],
                )
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    playerWidget.controller.dispose();
    super.dispose();
    super.dispose();
  }
}
