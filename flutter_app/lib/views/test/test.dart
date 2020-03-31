
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class MyAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String nextPage = "https://swapi.co/api/people";

  ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  List names = new List();
  final dio = new Dio();

  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final response = await dio.get(nextPage);
      print(response);
      List tempList = new List();
      nextPage = response.data['next'];
      for (int i = 0; i < response.data['results'].length; i++) {
        tempList.add(response.data['results'][i]);
      }

      setState(() {
        isLoading = false;
        names.addAll(tempList);
      });
    }
  }

  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
//+1 for progressbar
      itemCount: names.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == names.length) {
          return _buildProgressIndicator();
        } else {
          return new ListTile(
            title: Text((names[index]['name'])),
            onTap: () {
              print(names[index]);
            },
          );
        }
      },
      controller: _scrollController,
    );
  }

  var listClasses = [
    'Tất cả các khoá học',
    'khoá học của tôi',
    'lộ trình học tập',
    'đề thi',
    'lịch học sắp tới',
    'kết quả học tập',
    'họp trực tuyến'
  ];
  bool a = true;
  bool b = true;
  bool c = true;
  bool d = true;

  var currentListClasses = 'Tất cả các khoá học';

  void testSelect(String value) {
    if (value == "Tất cả các khoá học") {
      setState(() {
        a = true;
        b = true;
        c = true;
        d = true;
      });
    } else if (value == "khoá học của tôi") {
      setState(() {
        a = false;
        b = false;
        c = false;
        d = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 20, right: 10),
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200]),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: currentListClasses,
                        isExpanded: true,
                        hint: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Tất cả khoá học')),
                        items: listClasses.map((String value) {
                          return new DropdownMenuItem<String>(
                              child: new Text(value), value: value);
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            this.currentListClasses = value;
                            testSelect(value);
                            print(value);
                          });
                        }))),
            SizedBox(height: 20.0),
            Visibility(child: Text('Tất cả các khoá học'), visible: a),
            SizedBox(height: 20.0),
            Visibility(child: Text('khoá học của tôi'), visible: b),
            SizedBox(height: 20.0),
            Visibility(child: Text('lộ trình học tập'), visible: c),
            SizedBox(height: 20.0),
            Visibility(child: Text('đề thi'), visible: d),
            SizedBox(height: 20.0),
            Visibility(child: Text('lịch học sắp tới'), visible: true),
            SizedBox(height: 20.0),
            Visibility(child: Text('kết quả học tập'), visible: true),
            SizedBox(height: 20.0),
            Visibility(child: Text('họp trực tuyến'), visible: true),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
