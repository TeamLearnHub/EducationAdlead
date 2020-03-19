import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/classes/tabIntroduction.dart';
import 'package:flutter_app/views/classes/tabLession.dart';
import 'package:flutter_app/views/classes/tabRegister.dart';
import 'package:flutter_app/views/download/download_view.dart';
import 'package:flutter_app/views/test/test.dart';
import 'package:video_player/video_player.dart';

class ClassesDetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ClassesDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ClassesDetailPage extends StatefulWidget {
  @override
  ClassesDetailState createState() {
    // TODO: implement createState
    return ClassesDetailState();
  }
}

class ClassesDetailState extends State<ClassesDetailPage> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
  int _indexSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    _videoPlayerController1 = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/480/asdasdas.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  TabController controller;
  final List<String> option = [
    'ĐĂNG KÝ',
    'GIỚI THIỆU',
    'BÀI GIẢNG',
  ];
  final List<Icons> icons = [
  ];

  final _pageoption = [TabRegisterApp(),TabIntroductionApp(), TabLessionApp()];

  void _onItemTapped(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Container(
          padding: EdgeInsets.only(right: 35),
          alignment: Alignment.center,
          child: Text("Tất cả khoá học"),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Chewie(
                  controller: _chewieController,
                ),
                Container(
                  height: 40.0,
                  color: Colors.white,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: option.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              _onItemTapped(index);
                            },
                            child: Container(
                                width: 130,
                                color: index == _indexSelected
                                    ? Colors.black12
                                    : Colors.white,
                                height: 40.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      option[index],
                                      style: TextStyle(
                                          color: index == _indexSelected
                                              ? Colors.blue
                                              : Colors.red,
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
                  height: 425,
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
    _chewieController.dispose();
    super.dispose();
    super.dispose();
  }
}
