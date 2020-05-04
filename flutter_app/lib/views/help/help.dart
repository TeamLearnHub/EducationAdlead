import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/help/hlepdetails.dart';
import 'package:image_picker/image_picker.dart';
class TroGiup extends StatefulWidget {
  @override
  _trogiup createState() => _trogiup();
}

class _trogiup extends State<TroGiup> {
  File file;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){
            Navigator.pop(context);
          }),
          title: Text("Trợ giúp", style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height/35),),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
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
                        height: MediaQuery.of(context).size.height / 14,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1, bottom: 5),
                        child: Text(
                          "Vấn đề bạn đang gặp phải",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, color: Colors.black),
                        ),
                      ),
                      TextField(
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "Mô tả lỗi bạn đang gặp phải",
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: MediaQuery.of(context).size.height / 45),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text("Chi tiết ảnh lỗi",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height / 40, color: Colors.black)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 55,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child:   file == null ? Text(
                                "Đính kèm ảnh lỗi màn hình",
                                style:
                                TextStyle(fontSize: MediaQuery.of(context).size.height / 45, color: Colors.grey),
                              ): Image.file(file,  height: MediaQuery.of(context).size.height / 8,),),
                            Expanded(child:  IconButton(
                                icon: Icon(Icons.attach_file, color: Color(0xFFAA3234),), onPressed: () {getImage();})),
                          ],
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
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context){
                       return HelpDetail();
                      }));},
                      child: Container(
                        decoration: BoxDecoration(
                            gradient:LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.orange[200],Colors.orange],)
                        ),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 14,
                        child: Text(
                          "BÁO LỖI",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),

                    ))
              ],
            )));
  }
  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file= image;
    });

  }
}
