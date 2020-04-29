


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/notidication.dart';

class Notifiation extends StatefulWidget {
  @override
  _notification createState() => _notification();
}

class _notification extends State<Notifiation> {

  List<Notificatio> listnotification = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listnotification.add(new Notificatio("https://png.pngtree.com/png-clipart/20200224/original/pngtree-bell-icon-for-your-project-png-image_5215901.jpg", "Bạn có bài kiểm tra cuối khóa vào ngày hôm nay"));
    listnotification.add(new Notificatio("https://png.pngtree.com/png-clipart/20200224/original/pngtree-bell-icon-for-your-project-png-image_5215901.jpg", "Đã có kết quả bài kiểm tra cuối khóa, bạn vui lòng truy cập 'Kết quả học tập' để biết thêm thông tin chi tiết"));
    listnotification.add(new Notificatio("https://png.pngtree.com/png-clipart/20200224/original/pngtree-bell-icon-for-your-project-png-image_5215901.jpg", "Bạn có bài kiểm tra cuối khóa vào ngày hôm nay"));
    listnotification.add(new Notificatio("https://png.pngtree.com/png-clipart/20200224/original/pngtree-bell-icon-for-your-project-png-image_5215901.jpg", "Đã có kết quả bài kiểm tra cuối khóa, bạn vui lòng truy cập 'Kết quả học tập' để biết thêm thông tin chi tiết"));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(right: 15, top: 30,child: IconButton(icon: Icon(Icons.close, color: Colors.black,), onPressed:()=> Navigator.pop(context))),
            Positioned(top: 60,child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only( right: 15, left: 15),
              child: Stack(

                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 16,
                    decoration:  BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black,
                                width: 1
                            )
                        )
                    ),
                    child: Text("Thông báo", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height/35),),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 14,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: listnotification.length,
                            itemBuilder: (BuildContext context,int position){
                              return listNotifica(listnotification[position].url, listnotification[position].content,context);
                            }),
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
Widget  listNotifica(String url, String tile, BuildContext context){
  return Container(
    padding: EdgeInsets.only( bottom: 5,left: 5,right: 5),
    alignment: Alignment.centerLeft,
    width: double.infinity,
    height: MediaQuery.of(context).size.height / 8,
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey[400],
                width: 1
            )
        )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(flex: 2,child: CircleAvatar(
          backgroundImage: NetworkImage(url,),
          radius: MediaQuery.of(context).size.height/28,

        ),),
        SizedBox(width: 10,),
        Expanded(flex: 10,child: Text(tile, style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.height/50, fontWeight: FontWeight.w500),)),
        Expanded(child: SizedBox(
          width: 1,
        ))
      ],
    ),
  );
}
