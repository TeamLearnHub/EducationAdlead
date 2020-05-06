
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/schedule/schedule_presenter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:scoped_model/scoped_model.dart';

class TaoSuKienScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: LichHocViewModel.getInstance(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 10,
            title: Text("Tạo sự kiện", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          body: ScopedModelDescendant<LichHocViewModel>(
            builder: (context, child, model)=>(
                Container(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text("Tiêu đề", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                  child: Container(
                                    child: TextField(
                                      onChanged: null,
                                      decoration: InputDecoration.collapsed(hintText: "Nhập tiêu đề", hintStyle: TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text("Thời gian", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: Container(
//                  margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.grey),
                                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: AutoSizeText(
                                                "09:00",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                                maxLines: 1,
                                                maxFontSize: 16,
                                                minFontSize: 14,
                                              ),
                                            ),

                                            Container(
                                                margin: EdgeInsets.only(left: 20.0),
                                                child: IconButton(
                                                  icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFFAA3234),),
                                                  onPressed: () => {
                                                    DatePicker.showTimePicker(
                                                      context,
                                                      currentTime: DateTime.now(),
                                                      showTitleActions: true,
                                                      locale: LocaleType.vi,
                                                    )
                                                  },
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15.0),
                                        padding: const EdgeInsets.only(left: 15.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: Colors.grey),
                                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: AutoSizeText(
                                                "20/03/2020",
                                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                                maxLines: 1,
                                                maxFontSize: 16,
                                                minFontSize: 14,
                                              ),
                                            ),

                                            Container(
                                                margin: EdgeInsets.only(left: 30.0),
                                                child: IconButton(
                                                    icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFFAA3234),),
                                                    onPressed: () => {
                                                      DatePicker.showDatePicker(
                                                          context,
                                                          showTitleActions: true,
                                                          minTime: DateTime(2000, 1, 1),
                                                          maxTime: DateTime(2022, 12, 31),
                                                          currentTime: DateTime.now(), locale: LocaleType.vi)
                                                    }
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text("Địa điểm", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                ),
                                Container(
//              margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                                  padding: const EdgeInsets.only(left: 15.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                  child: Container(
                                    child: TextField(
                                      onChanged: null,
                                      decoration: InputDecoration.collapsed(hintText: "Nhập địa điểm", hintStyle: TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text("Nhắc lịch", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(2);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 2? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Mon", style: TextStyle(color: model.i == 2? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(3);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 3? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Tue", style: TextStyle(color: model.i == 3? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(4);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 4? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Wed", style: TextStyle(color: model.i == 4? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(5);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 5? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Thu", style: TextStyle(color: model.i == 5? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 65.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(6);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 6? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Fri", style: TextStyle(color: model.i == 6? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(7);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 7? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Sat", style: TextStyle(color: model.i == 7? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),

                                      GestureDetector(
                                        onTap: (){
                                          model.setCo(0);
                                        },
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          child: CircleAvatar(
                                            backgroundColor: model.i == 0? Color(0xFFE8943A): Color(0xFFF3F6F9),
                                            child: Text("Sun", style: TextStyle(color: model.i == 0? Colors.white: Colors.black, fontWeight: FontWeight.w400,)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text("Chi tiết", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                ),
                                Container(
//              margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                                  padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  ),
                                  child: Container(
                                    child: TextField(
                                      maxLines: 5,
                                      onChanged: null,
                                      decoration: InputDecoration.collapsed(hintText: "Nhập tiêu đề", hintStyle: TextStyle(color: Colors.grey)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 10.0,),

                          RaisedButton(
                              padding: EdgeInsets.all(0.0),
                              child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xFFFAA244),Color(0xFFFF8400)],
                                      )
                                  ),
                                  child: Text("LƯU", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                              ),
                              onPressed: null
                          ),
                        ],
                      )
                  ),
                )
            ),
          )
      ),
    );
  }
}
