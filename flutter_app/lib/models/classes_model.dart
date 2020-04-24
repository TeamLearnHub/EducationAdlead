import 'dart:convert';

import 'package:flutter_app/service/Webservice.dart';

class ClassesModel {
  final String title;
  final String avatar;
  final String file_mp4;

  ClassesModel({this.title, this.avatar, this.file_mp4});

  factory ClassesModel.fromJson(Map<String, dynamic> json) {
    return ClassesModel(
        title: json['message'],
        avatar: json['avatar'],
        file_mp4: json['file_mp4']);
  }

  static Resource<List<ClassesModel>> get all {
    return Resource(
        url: "http://demo4855049.mockable.io/gethotvideo",
        parse: (response) {
          final result = json.decode(response.body);
          print(result);
          return result
              .map<ClassesModel>((model) =>
                  ClassesModel.fromJson(model as Map<String, dynamic>))
              .toList();
        });
  }
}
