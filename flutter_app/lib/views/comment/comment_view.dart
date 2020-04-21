import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() {
    // TODO: implement createState
    return _CommentPageState();
  }
}

class _CommentPageState extends State<CommentPage> {
  bool a = false;
  List<String> _comment = [];
  List<String> _question = [];
  bool _isComment = true;

  void _addComment(String val) {
    setState(() {
      _comment.add(val);
//      if (_isComment) {
//        _comment.add(val);
//      } else {
//        _question.add(val);
//      }
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
    return Container(
      color: Hexcolor('FEFAF5'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                left: 15.0, right: 10.0, bottom: 15.0, top: 15.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avartar.jpg'),
              radius: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 25.0, bottom: 8.0),
                    child: Text(
                      'Nguyễn Tiến Đạt',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5.0, top: 25.0, bottom: 8.0),
                    child: Text(' | 12h',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16.0)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: .0, right: 5.0, bottom: 10.0, top: 2),
                child: Text(comment,
                    style:
                        TextStyle(fontSize: 15.0, color: Hexcolor('#212121'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 0.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image(image: AssetImage('assets/ic_like.png')),
                        SizedBox(width: 10),
                        Text('17',
                            style: TextStyle(
                                color: Hexcolor('#AA3234'), fontSize: 16.0)),
                        SizedBox(width: 30.0),
                        Image(image: AssetImage('assets/ic_unlike.png')),
                        SizedBox(width: 30.0),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              a = true;
                            });
                          },
                          child:
                              Image(image: AssetImage('assets/ic_comment.png')),
                        ),
                        SizedBox(width: 10),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Text('2',
                              style: TextStyle(
                                  color: Hexcolor('#AA3234'), fontSize: 16.0)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Visibility(
                  child: login(),
                  visible: a)
            ],
          ),
        ],
      ),
    );
  }

  Widget login(){
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                padding:
                EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Hexcolor('#F5F6F9'),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tên đăng nhập',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50,
                margin: EdgeInsets.only(top: 32),
                padding:
                EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Hexcolor('#F5F6F9'),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 60),
              InkWell(
                onTap: () {

//                      Preferences.setToken("ojsjjsjjsjs");
//                    print('hello token = ' +Preferences.getToken());
//                      _preseneter.login(cntrlEmail.toString(), cntrlPassword.toString());
                },
                child: new Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Hexcolor('#FAA244'), Hexcolor('#FF8400')],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      'Đăng nhập'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Quên mật khẩu ?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

//  Widget _buildQuestionItem(String comment) {
////    return ListTile(title: Text(comment));
//    return Column(
//      children: <Widget>[
//        Row(
//          children: <Widget>[
//            SizedBox(height: 10),
//            Container(
//              margin: const EdgeInsets.only(left: 100.0, right: 5.0, top: 10.0),
//              child: CircleAvatar(
//                backgroundImage: NetworkImage(
//                    "https://www.facebook.com/photo.php?fbid=1223906294484690&set=a.253994294809233&type=3&theater"),
//              ),
//            ),
//            Container(
//              margin: const EdgeInsets.only(left: 5.0, right: 10.0, top: 10.0),
//              child: Text('Nguyễn Tiến Đạt',
//                  style:
//                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
//            ),
//            Container(
//              margin: const EdgeInsets.only(right: 5.0, top: 10.0),
//              child: Text(comment,
//                  style:
//                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
//            )
//          ],
//        ),
//        SizedBox(height: 10.0),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Container(
//              margin: const EdgeInsets.only(left: 155.0),
//              child: Text('12 giờ ',
//                  style:
//                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
//            ),
//            Container(
//              margin: const EdgeInsets.only(left: 0.0),
//              child: Text('Thích',
//                  style:
//                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0)),
//            ),
//            Container(
//                margin: const EdgeInsets.only(left: 0.0, right: 45.0),
//                child: GestureDetector(
//                  onTap: () {
//                    setState(() {
//                      a = true;
//                    });
//                  },
//                  child: Text('Trả lời',
//                      style: TextStyle(
//                          fontWeight: FontWeight.w500, fontSize: 15.0)),
//                )),
//          ],
//        ),
//        Text('Hello LearnHub',style: TextStyle(fontSize: 25.0)),
//
//      ],
//    );
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      a = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 0.5,
            height: 80,
            child: TextFormField(
              onFieldSubmitted: (String submittedStr) {
                _addComment(submittedStr);
              },
              autocorrect: true,
              style: TextStyle(fontSize: 18, height: 2.5),
              decoration: InputDecoration(
                  prefixIcon: CircleAvatar(
                      backgroundImage: AssetImage('assets/avartar.jpg'),
                      radius: 25),
                  hintStyle: TextStyle(color: Hexcolor('#434343')),
                  border: InputBorder.none,
                  filled: true,
                  contentPadding: const EdgeInsets.all(20.0),
                  hintText: "Bình luận của bạn"),
            ),
          ),
          Expanded(child: _buildCommentList())
        ],
      ),
    );
  }
}
