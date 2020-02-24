import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: CommentPage(),
    );
  }
}

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() {
    // TODO: implement createState
    return _CommentPageState();
  }
}

class _CommentPageState extends State<CommentPage> {

  List<String> _comment = [];
  List<String> _question = [];
  bool _isComment = true;

  void _addComment(String val) {
    setState(() {
      if (_isComment) {
        _comment.add(val);
      } else {
        _question.add(val);
      }
    });
  }

  Widget _buildCommentList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comment.length) {
        return _buildCommentItem(_comment[index]);
      }
    });
  }

  Widget _buildCommentItem(String comment) {
//    return ListTile(title: Text(comment));
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 5.0, top: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://www.nretnil.com/avatar/LawrenceEzekielAmos.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 10.0, top: 10.0),
              child: Text('Nguyễn Tiến Đạt',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5.0, top: 10.0),
              child: Text(comment,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 55.0),
              child: Text('12 giờ ',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0.0),
              child: Text('Thích',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0.0, right: 45.0),
              child: Text('Trả lời',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            ),
          ],
        ),
//        if(_question){
//          _buildQuestionItem(comment)
//        }
      ],
    );
  }

  Widget _buildQuestionItem(String comment) {
//    return ListTile(title: Text(comment));
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 100.0, right: 5.0, top: 10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://www.nretnil.com/avatar/LawrenceEzekielAmos.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 10.0, top: 10.0),
              child: Text('Nguyễn Tiến Đạt',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5.0, top: 10.0),
              child: Text(comment,
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 155.0),
              child: Text('12 giờ ',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0.0),
              child: Text('Thích',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 0.0, right: 45.0),
              child: Text('Trả lời',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(title: Text('Comments')),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildCommentList()),
          TextField(
            onSubmitted: (String submittedStr) {
              _addComment(submittedStr);
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20.0),
                hintText: "Viết bình luận "),
          )
        ],
      ),
    );
  }
}
