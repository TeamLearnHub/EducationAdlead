import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class LoadingBaseSate<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title()),
      ),
      body: isLoading()
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : content(),
    );
  }

  Widget content();

  String title();

  bool isLoading();
}
