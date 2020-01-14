import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/Tab_home_view.dart';

class HomePage extends StatefulWidget {
  @override
  _Home createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _pageoption = [PageHome(), PageHome(), PageHome()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Dataseach());
            }),
        title: TextField(
          obscureText: true,
          onTap: () {
            showSearch(context: context, delegate: Dataseach());
          },
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Tìm kiếm',
              hintStyle: TextStyle(color: Color(0xFFd0cbcb))),
        ),
        actions: <Widget>[Icon(Icons.shopping_cart)],
      ),
      body: _pageoption[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('Store'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

class Dataseach extends SearchDelegate<String> {
  final watches = ["Casio", "Xaomi", "Apple watch"];
  final recentwatchs = ["Seiko", "Tissot", "Ogival"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.deepPurple,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentwatchs
        : watches.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.watch),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(color: Colors.black),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
