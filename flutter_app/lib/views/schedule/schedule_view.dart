import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/schedule.dart';
import 'package:flutter_app/views/schedule/create_event.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class LichHocScreen extends StatelessWidget {
  final url = "http://demo4855049.mockable.io/gethotvideo";

  Future<List<Movie>> fetchMovies(http.Client client) async {
    final response = await client.get(url);
    List<dynamic> body = jsonDecode(response.body);
    List<Movie> listMovies = body.map((dynamic item) => Movie.fromJson(item)).toList();
    return listMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Lịch học", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),),
        elevation: 10,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TaoSuKienScreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 26,
                    height: 26,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFAA3234),
                      child: Text("+", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.only(left:5.0, right: 10.0),
                      child: Text("TẠO EVENT", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),)
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            flex: 9,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Padding(

                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: AutoSizeText(
                                          "01/01/2020",
                                          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                          maxFontSize: 14,
                                          minFontSize: 12,
                                        ),
                                      )
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        icon: Icon(Icons.date_range, color: Colors.grey,),
                                        onPressed: () => {
                                          DatePicker.showDatePicker(
                                            context,
                                            showTitleActions: true,
                                            minTime: DateTime(2000, 1, 1),
                                            maxTime: DateTime(2022, 12, 31),
                                            currentTime: DateTime.now(),)
                                        }),
                                  ),
                                ],
                              ),
                            )
                        ),

                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 12.0,
                            height: 2.0,
                            color: Colors.black,
                            margin: EdgeInsets.only(right: 10.0, left: 10.0),
                          ),
                        ),

                        Expanded(
                            flex: 9,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF5F6F9),
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: AutoSizeText(
                                          "01/12/2020",
                                          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                                          maxLines: 1,
                                          maxFontSize: 14,
                                          minFontSize: 12,
                                        ),
                                      )
                                  ),

                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        icon: Icon(Icons.date_range, color: Colors.grey,),
                                        onPressed: () => {
                                          DatePicker.showDatePicker(
                                              context,
                                              showTitleActions: true,
                                              minTime: DateTime(2000, 1, 1),
                                              maxTime: DateTime(2022, 12, 31),
                                              currentTime: DateTime.now(), locale: LocaleType.vi)
                                        }),
                                  ),
                                ],
                              ),
                            )
                        )


                      ],
                    ),
                  ),
                ),
              ),

              FutureBuilder(
                future: fetchMovies(http.Client()),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      break;
                    case ConnectionState.active:
                      return Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Container(
                          child: Center(
                            child: Text("AAAAAA"),
                          ),
                        );
                      } else {
                        //print(snapshot.data);
                        return Expanded(
                            flex: 17,
                            child: Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: BuildList(listMovies: snapshot.data,)
                            )
                        );
                      }
                      break;
                  }
                  return Container();
                },
              ),
            ]),
      ),
    );
  }
}

class BuildList extends StatelessWidget {
  List<Movie> listMovies;
  BuildList({Key key, this.listMovies}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listMovies.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              color: Color(0xFFF5F6F9),
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1.0, color: Colors.grey)
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/logo_schedule2.png"))
                                ),
                              ),

                              Container(
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/logo_schedule3.png"))
                                ),
                              ),

                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/logo_schedule1.png"))
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  "Kỹ năng quản lý thời gian",
                                  minFontSize: 15,
                                  maxFontSize: 17,
                                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text("Lớp: K12 | Mã lớp: 005", style: TextStyle(color: Color(0xFFE8943A), fontSize: 12, fontWeight: FontWeight.w500),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Loại hình"),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text("Online", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Giáo viên"),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text("Lê Bảo Châu", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Thời gian"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text("01/03/2020 - 20/03/2020", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
