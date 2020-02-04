import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as prefix0;

class CallApi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: PostsPage(),
      ),
      drawer: new Drawer(
        child: ListView.builder(itemBuilder: (context, index) {}),
//        child: ListView(
//          children: <Widget>[
//            ListTile(
//              title: Text("Ttem 1"),
//              trailing: Icon(Icons.arrow_forward),
//            ),
//            ListTile(
//              title: Text("Item 2"),
//              trailing: Icon(Icons.arrow_forward),
//            ),
//          ],
//        ),
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text('Title'),
                      subtitle: Text(post.title),
                    ),
                    ListTile(
                      title: Text('ID'),
                      subtitle: Text("${post.id}"),
                    ),
                    ListTile(
                      title: Text("Body"),
                      subtitle: Text(post.body),
                    ),
                    ListTile(
                      title: Text("User ID"),
                      subtitle: Text("${post.userId}"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
          future: httpService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;

              return ListView(
                children: posts
                    .map(
                      (Post post) => ListTile(
                        title: Text(post.title),
                        subtitle: Text("${post.userId}"),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PostDetail(post: post),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {@required this.userId,
      @required this.id,
      @required this.title,
      @required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String);
  }
}

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    prefix0.Response res = await get(postsURL);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }
}
