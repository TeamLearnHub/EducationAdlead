import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassesPage(),
    );
  }
}

Widget _buildListItem() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Kỹ năng quản lý',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.00),
          ),
        ),
      ),
      ListView.builder(
        padding: EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: <Widget>[
                  Center(
                    child: Image.network(
                        "https://i.picsum.photos/id/9/250/250.jpg",
                        height: 120,
                        width: 120),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Kỹ năng quản lý thời gian',
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Icon(Icons.person),
                            ),
                            Text('30M',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(Icons.home),
                            ),
                            Text('05 Lớp',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(
                                margin: const EdgeInsets.only(
                                    left: 25.0, right: 25.0)),
                            Container(
                              child: Icon(Icons.closed_caption),
                            ),
                            Text('07 ngày 18 giờ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
        itemCount: 4,
        shrinkWrap: true,
        // todo comment this out and check the result
        physics:
            ClampingScrollPhysics(), // todo comment this out and check the result
      ),
    ],
  );
}

class ClassesPage extends StatefulWidget {
  @override
  ClassesPageState createState() {
    // TODO: implement createState
    return ClassesPageState();
  }
}

class PopupMenu {
  static const all = "Tất cả";
  static const dkm = "Kỹ năng quản lý";
  static const dccc = "Kỹ năng mềm";
  static const cccc = "Khoá học Offline";
  static const cccd = "Quy trình nghiệp vụ";
  static const List<String> popup = <String>[all, dkm, dccc, cccc, cccd];
}

class ClassesPageState extends State<ClassesPage> {
  bool visibilityAll = false;
  bool visibilityTag = false;
  bool visibility = false;

  void choice(String choice) {
    if (choice == PopupMenu.all) {
      setState(() {
        print(PopupMenu.all);
        visibilityAll = true;
        visibilityTag = true;
      });
    } else if (choice == PopupMenu.dkm) {
      setState(() {
        print(PopupMenu.dkm);
        visibilityTag = false;
        visibilityAll = false;
      });
    } else if (choice == PopupMenu.dccc) {
      setState(() {
        print(PopupMenu.dccc);
      });
    } else if (choice == PopupMenu.cccc) {
      setState(() {
        print(PopupMenu.cccc);
      });
    } else if (choice == PopupMenu.cccd) {
      setState(() {
        print(PopupMenu.cccd);
      });
    }
  }

  Widget _buildMainContent() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Visibility(child: _buildListItem(), visible: visibilityAll),
            Visibility(child: _buildListItem(), visible: visibilityTag),
            _buildListItem(),
            _buildListItem(),
          ]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFfbe3ee),
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
            child: Text("Tất cả các khoá học"),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black87,
              ),
              itemBuilder: (BuildContext context) {
                return PopupMenu.popup.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
              onSelected: choice,
            ),
          ],
        ),
        body: _buildMainContent());
  }
}
