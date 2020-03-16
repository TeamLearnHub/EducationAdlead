import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabIntroductionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TabIntroductionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabIntroductionPage extends StatefulWidget {
  @override
  _TabIntroductionState createState() {
    // TODO: implement createState
    return _TabIntroductionState();
  }
}

class _TabIntroductionState extends State<TabIntroductionPage> {
  bool monVal = false;

  bool isChecked = false;

  var resultHolder = 'Checkbox is UN-CHECKED';

  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        resultHolder = 'Checkbox is CHECKED';
        print(resultHolder);
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        resultHolder = 'Checkbox is UN-CHECKED';
        print(resultHolder);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0,top: 20.0,bottom: 20.0),
              child: Text('BẠN SẼ NHẬN ĐƯỢC GÌ TỪ KHOÁ HỌC'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold)),
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: isChecked,
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      print(value);
                      toggleCheckbox(value);
                    }),
                Text('SẮP XẾP THỜI GIAN LÀM VIỆC khoa học'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Checkbox(
                    value: monVal,
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      print(value);

                    }),
                Text('quản lý THỜI GIAN LÀM VIỆC của bản thân'.toUpperCase(),maxLines : 2,style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Checkbox(
                    value: monVal,
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      print(value);

                    }),
                Text('Sắp xếp thời gian làm việc cho nhân sự'.toUpperCase(),maxLines : 2,style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Checkbox(
                    value: monVal,
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      print(value);

                    }),
                Text('quản lý THỜI GIAN LÀM VIỆC của bản thân'.toUpperCase(),maxLines : 2,style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0,top: 20.0,bottom: 20.0),
              child: Text('BẠN cần làm gì để đạt được mục tiêu'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold)),
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: monVal,
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      print(value);

                    }),
                Text('thực hiện theo đúng lộ trình học tập'.toUpperCase(),maxLines : 2,style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Checkbox(
                    value: monVal,
                    activeColor: Colors.pink,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      print(value);
                    }),
                Text('hoàn thành đầy đủ các bài kiểm tra'.toUpperCase(),maxLines : 2,style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
