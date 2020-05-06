

import 'package:scoped_model/scoped_model.dart';

class LichHocViewModel extends Model{
  static LichHocViewModel _instance;
  int i = 2;

  static LichHocViewModel getInstance() {

    if (_instance == null) {
      _instance = LichHocViewModel();
    }
    return _instance;
  }

  void setCo(int i1){
    this.i = i1;
    notifyListeners();
  }
}