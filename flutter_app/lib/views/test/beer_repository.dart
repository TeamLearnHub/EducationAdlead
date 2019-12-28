import 'dart:convert';

import 'package:flutter_app/Api_endpoint.dart';

import 'Beer.dart';
import 'package:http/http.dart' as http;

Future<Stream<Beer>> getBeers() async {
  final String url = ApiEndPoint.DEMO;
  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Beer.fromJson(data));
}
