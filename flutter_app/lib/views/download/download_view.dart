import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class downloadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: downloadPage(),
    );
  }
}

class downloadPage extends StatefulWidget {
  @override
  _downloadPageState createState() {
    // TODO: implement createState
    return _downloadPageState();
  }
}

class _downloadPageState extends State<downloadPage> {
  String url = 'https://firebasestorage.googleapis.com/v0/b/filledstacks.appspot.com/o/filledstacks_tutorials.pdf?alt=media&token=a5e671e7-5acd-4bc4-a167-8d8483954d2a';
  String title = "Waiting to download";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async{
       setState(() {
         title = 'Downloading....';
       });
       var fetchedFile = await DefaultCacheManager().getSingleFile(url);
       setState(() {
         title = 'File fetched : ${fetchedFile.path}';
       });
      }),
      body: Center(child: Text(title)),
    );
  }
}
