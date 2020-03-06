import 'package:flutter/material.dart';

class GiaodichApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Giaodich(),
    );
  }

}

class Giaodich extends StatefulWidget {
  @override
  _giaodich createState() {
    // TODO: implement createState
    return _giaodich();
  }
}

class PopupMenu {
  static const all = "Tất cả";
  static const dkm = "Đăng kí mới";
  static const dccc = "Đã có chứng chỉ";
  static const cccc = "Chưa có chứng chỉ";

  static const List<String> popup = <String>[all, dkm, dccc, cccc];
}
class List1 {
  final title,datedk,nameclass,iddk,idclass,status,chungchi,datestart,dateend;

  List1(this.title, this.datedk, this.nameclass, this.iddk, this.idclass, this.status, this.chungchi, this.datestart, this.dateend);

}

class _giaodich extends State<Giaodich> {
  final List<List1> tasks1 = new List();
  List<List1> listfilter = new List();

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    setState(() {
      tasks1.add(new List1("Kĩ năng quản lý thời gian", "10/1/2020", "13351",
          "ph06522", "pt13351", "active", "none", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng quản lý đội nhóm", "10/1/2020", "13351",
          "ph06522", "pt13351", "active", "done", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng xử lý data thô", "10/1/2020", "13351",
          "ph06522", "pt13351", "active", "none", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng quản lý tiền bạc", "10/1/2020", "13351",
          "ph06522", "pt13351", "active", "done", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng làm việc", "10/1/2020", "13351", "ph06522",
          "pt13351", "active", "none", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng làm việc", "10/1/2020", "13351", "ph06522",
          "pt13351", "active", "done", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng làm việc", "10/1/2020", "13351", "ph06522",
          "pt13351", "active", "none", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng làm việc", "10/1/2020", "13351", "ph06522",
          "pt13351", "active", "none", "1/03/2020", "1/05/2020"));
      tasks1.add(new List1("Kĩ năng làm việc", "10/1/2020", "13351", "ph06522",
          "pt13351", "active", "done", "1/03/2020", "1/05/2020"));
      listfilter = tasks1;
    });
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfbe3ee),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 23,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Container(
          padding: EdgeInsets.only(right: 35),
          alignment: Alignment.center,
          child: Text("Giao dịch"),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black87,
            ),
            itemBuilder: (BuildContext context) {
              return PopupMenu.popup.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: choice,
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: listfilter.length,
            itemBuilder: (context, position) {
              return Container(
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.black)),
                ),
                child: _myListContainer(
                    listfilter[position].title,
                    listfilter[position].datedk,
                    listfilter[position].nameclass,
                    listfilter[position].iddk,
                    listfilter[position].idclass,
                    listfilter[position].status,
                    listfilter[position].chungchi,
                    listfilter[position].datestart,
                    listfilter[position].dateend),
              );
            }),
      ),
    );
  }

  void choice(String choice) {
    if (choice == PopupMenu.all) {
      setState(() {
        listfilter = tasks1;
      });
    } else if (choice == PopupMenu.dkm) {
      setState(() {
        listfilter = tasks1;
      });
    } else if (choice == PopupMenu.dccc) {
      setState(() {
        listfilter = tasks1
            .where((u) => (u.chungchi.toLowerCase().contains("done")))
            .toList();
      });
    } else if (choice == PopupMenu.cccc) {
      setState(() {
        listfilter = tasks1
            .where((u) => (u.chungchi.toLowerCase().contains("none")))
            .toList();
      });
    }
  }

  Widget _myListContainer(
      String title,
      String datedk,
      String nameclass,
      String iddk,
      String idclass,
      String status,
      String chungchi,
      String datestart,
      String dateend) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black)),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Ngày đăng kí: " + datedk),
                        Text("Tên lớp: " + nameclass),
                        Text("Trạng thái: " + status),
                        Text("Ngày bắt đầu: " + datestart),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Mã đăng kí: " + iddk),
                        Text("Mã lớp: " + idclass),
                        Text(
                          "Chứng chỉ: " + chungchi,
                          style: TextStyle(
                              color: (chungchi == "done")
                                  ? Colors.blueAccent
                                  : Colors.grey),
                        ),
                        Text("Ngày kết thúc: " + dateend),
                      ],
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
