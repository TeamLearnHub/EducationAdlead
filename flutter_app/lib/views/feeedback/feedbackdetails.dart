
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/home/home_tab.dart';
import 'package:flutter_app/views/home/home_view.dart';
class FeedBackDetail extends StatefulWidget{
  @override
  _feedbackDetail createState() =>_feedbackDetail();
}
class _feedbackDetail extends State<FeedBackDetail>{
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
                      "Cảm ơn bạn đã góp ý cho",
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
              child: Text("Chúng tôi luôn lỗ lực và cố gắng để mang lại trải nghiệm tốt nhất cho học viên và doanh nghiệp.",textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.height / 45),),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeTabApp()));
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