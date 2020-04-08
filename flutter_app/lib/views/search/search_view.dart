import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchViewPage extends StatefulWidget {
  @override
  SearchViewSate createState() {
    // TODO: implement createState
    return SearchViewSate();
  }
}

class ClassesItem {
  final String title;
  final String description;

  ClassesItem(this.title, this.description);
}

class SearchViewSate extends State<SearchViewPage> {
  Future<List<ClassesItem>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return ClassesItem("Title : $search", "Description : $search");
    });
  }

  @override
  Widget build(BuildContext context) {
    var ic_search = new Image(
        image: AssetImage('assets/ic_search.png'), height: 35, width: 50);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Hexcolor('#FFFFFF'),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<ClassesItem>(
          icon: ic_search,
          searchBarStyle: SearchBarStyle(
              backgroundColor: Hexcolor('f5f6f9'), padding: EdgeInsets.all(2)),
          onSearch: search,
          onItemFound: (ClassesItem classItem, int index) {
            return ListTile(
              title: Text(classItem.title),
              subtitle: Text(classItem.description),
            );
          },
        ),
      )),
    );
  }
}
