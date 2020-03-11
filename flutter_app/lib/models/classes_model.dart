import 'dart:convert';

import 'package:flutter_app/service/Webservice.dart';

class ClassesModel {
  final String title;
  final String avatar;

  ClassesModel({this.title, this.avatar});

  factory ClassesModel.fromJson(Map<String, dynamic> json) {
    return ClassesModel(title: json['title'], avatar: json['avatar']);
  }

  static Resource<List<ClassesModel>> get all {
    return Resource(
        url: "http://demo4855049.mockable.io/gethotvideo",
        parse: (response) {
          final result = json.decode(response.body);
          print(result);
          return result
              .map<ClassesModel>((model) => ClassesModel.fromJson(model as Map<String, dynamic>))
              .toList();
        });
  }
}
