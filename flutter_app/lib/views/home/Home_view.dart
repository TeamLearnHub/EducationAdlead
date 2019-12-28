import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          'HomePage',
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: Center(
          child: Center(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}


