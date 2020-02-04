import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final dummySnapshot = [
  {"name": "Filip", "votes": 15},
  {"name": "Abraham", "votes": 14},
  {"name": "Richard", "votes": 11},
  {"name": "Ike", "votes": 10},
  {"name": "Justin", "votes": 1},
];

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Baby Names',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Baby Name Votes'),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return _buildList(context, dummySnapshot);
}

Widget _buildList(BuildContext context, List<Map> snapshot) {
  return ListView(
    padding: const EdgeInsets.only(top: 20.0),
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, Map data) {
  final record = Record.fromMap(data);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    key: ValueKey(record.name),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffb74093)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(record.name),
        trailing: Text('Hello'),
        onTap: () => print(record),
      ),
    ),
  );
}

class Record {
  final String name;

  Record(this.name);

  Record.fromMap(Map<String, dynamic> map)
      : assert(map['name'] != null),
        name = map['name'];
}
