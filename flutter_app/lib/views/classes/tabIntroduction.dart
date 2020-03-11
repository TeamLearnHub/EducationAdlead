import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabIntroductionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TabIntroductionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabIntroductionPage extends StatefulWidget {
  @override
  _TabIntroductionState createState() {
    // TODO: implement createState
    return _TabIntroductionState();
  }
}

class _TabIntroductionState extends State<TabIntroductionPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

        ),
      ),
    );
  }
}
