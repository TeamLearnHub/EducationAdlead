

import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/home_tab.dart';
import 'package:flutter_app/views/home/home_view.dart';

class HelpDetail extends StatefulWidget {
  @override
  _helpDetail createState() => _helpDetail();
}

class _helpDetail extends State<HelpDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/ 1.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 30),
                      child: Image.network("https://2.bp.blogspot.com/-vJ29YHzaxm0/Uc-vunIxPTI/AAAAAAAAB3M/pkE7sFU_t1A/s200/nghi-thuc-cui-chao-cua-nguoi_Nhat.gif", height: MediaQuery.of(context).size.height/5 ,),),
                    Text(
                      "Cảm ơn bạn đã báo lỗi cho",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      "chúng tôi!",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    )
                  ],
                )
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 40),
              width: MediaQuery.of(context).size.width/ 1.2,
              child: Text("Chúng tôi sẽ kiểm tra thông tin lỗi và hỗ trợ bạn trong thời gian sớm nhất. Chúng tôi rất xin lỗi về sự bất tiện này.",textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45),),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(29),
                  gradient:LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.orange[200],Colors.orange],)
              ),
              child: FlatButton(

                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29)
                ) ,
                onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context){
                   return HomeTabApp();
                 }));
                },child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.width/ 2.4,
                child: Text("VỀ TRANG CHỦ", style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
