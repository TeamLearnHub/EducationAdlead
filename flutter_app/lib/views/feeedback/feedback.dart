
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/feeedback/feedbackdetails.dart';
enum SingingCharacter { lafayette, jefferson }
class FeedBack extends StatefulWidget{
  @override
  _feedBack createState() => _feedBack();

}
class _feedBack extends State<FeedBack>{
  SingingCharacter _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){
            Navigator.pop(context);
          }),
          title: Text("Góp ý", style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height/35),),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          "LearnHub xin lắng nghe!",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: MediaQuery.of(context).size.height / 40, color: Color(0xFFAA3234)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Chúng tôi có thể giúp gì cho bạn?",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Padding(padding: EdgeInsets.only(top: 1),child: Text("Bạn muốn góp ý về", style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Radio(
                                activeColor:Color(0xFFAA3234) ,
                                value: SingingCharacter.lafayette,
                                groupValue: _character,
                                onChanged: (SingingCharacter value) {
                                  setState(() { _character = value; });
                                },
                              ),
                              Text('Hệ thống học tập', style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45, color: Colors.black, fontWeight: FontWeight.w700),),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              Radio(
                                activeColor:Color(0xFFAA3234) ,
                                value: SingingCharacter.jefferson,
                                groupValue: _character,
                                onChanged: (SingingCharacter value) {
                                  setState(() { _character = value; });
                                },
                              ),
                              Text('Giáo viên', style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45, color: Colors.black, fontWeight: FontWeight.w700),),

                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1, bottom: 5),
                        child: Text(
                          "Thông tin chi tiết bạn góp ý",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, color: Colors.black),
                        ),
                      ),
                      TextField(
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "Thông tin góp ý",
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 40),
                          border: OutlineInputBorder(),
                        ),
                      ),

                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> FeedBackDetail()));
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient:LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.orange[200],Colors.orange])
                        ),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 14,
                        child: Text(
                          "GỬI",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),

                    ))
              ],
            ))
    );
  }

}