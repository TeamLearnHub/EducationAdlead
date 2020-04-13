import 'package:custom_chewie/custom_chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/classes_model.dart';
import 'package:flutter_app/views/classes/tabIntroduction.dart';
import 'package:flutter_app/views/classes/tabLession.dart';
import 'package:flutter_app/views/classes/tabListClass.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

class ClassesDetailPage extends StatefulWidget {
  final ClassesModel classesModel;

  ClassesDetailPage({Key key, @required this.classesModel}) : super(key: key);

  @override
  ClassesDetailState createState() {
    // TODO: implement createState
    return ClassesDetailState(classesModel);
  }
}

class ClassesDetailState extends State<ClassesDetailPage> {
  //pass data
  ClassesModel classesModel;

  ClassesDetailState(this.classesModel);

  static VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;

  //ChewieController _chewieController;
  int _indexSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
//    _chewieController = ChewieController(
//        videoPlayerController: _videoPlayerController1,
//        allowFullScreen: true,
//        aspectRatio: 16 / 9,
//        autoPlay: true,
//        looping: true,
//        errorBuilder: (context, errorMessage) {
//          return Center(
//            child: Text(errorMessage, style: TextStyle(color: Colors.white)),
//          );
//        });
    super.initState();
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
    'Danh sách lớp'.toUpperCase(),
    'GIỚI THIỆU'.toUpperCase(),
    'BÀI GIẢNG'.toUpperCase(),
  ];
  final List<Icons> icons = [];

  final _pageoption = [
    TabListClassPage(),
    TabIntroductionPage(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage('assets/ic_classes_detail.png')),
//            GestureDetector(
//              onTap: () {
//                Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (context) {
//                  return ClassesDetailPage(classesModel: project);
//                }));
//              },
//              child: Center(
//                child: Image.network(project?.avatar,
//                    height: 130, width: 130),
//              ),
//            ),
            GestureDetector(
//              onTap: () {
//                Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (context) {
//                  return ClassesDetailPage(classesModel: project);
//                }));
//              },
//              onLongPress: () {
//                Navigator.of(context)
//                    .push(MaterialPageRoute(builder: (context) {
//                  return ClassesDetailPage(classesModel: project);
//                }));
//              },
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
                        Text('07d 18h',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Hexcolor('#787878'))),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 5.0, top: 10.0, bottom: 10.0, right: 20.0),
                      child: InkWell(
                        onTap: () {
                          showDialogConfirm(context);
                        },
                        child: new Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Hexcolor('#FAA244'),
                                  Hexcolor('#FF8400')
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
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
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void showDialogConfirm(BuildContext context) {
    Dialog confirmDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Center(
                  child: Text(
                    'Cảm ơn bạn đã đăng ký khoá học này. Hãy chờ thông tin kiểm duyệt từ ban quản lý!',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Hexcolor('#212121'), fontSize: 16.0),
                  ),
                )),
            SizedBox(height: 15.0),
            Image(image: AssetImage('assets/ic_line_big.png')),
            SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Đồng ý'.toUpperCase(),
                style: TextStyle(fontSize: 18.0, color: Hexcolor('#AA3234'),fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => confirmDialog);
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
//                    Chewie(
//                      controller: _chewieController,
//                    ),
//                    GestureDetector(
//                      onTap: () {
//                        Navigator.pop(context);
//                      },
//                      child: Image(
//                          image: AssetImage('assets/ic_close.png'),
//                          color: Hexcolor('#FFFFFF')),
//                    )
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
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    // _chewieController.dispose();
    playerWidget.controller.dispose();

    super.dispose();
    super.dispose();
  }
}
