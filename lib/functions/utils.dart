import 'dart:convert';

import 'package:learning_data_architecture_in_flutter/models/data_model.dart';

String fromMapToString({required Map<String, dynamic> map}) {
  String jsonString = json.encode(map);
  return jsonString;
}

Map<String, dynamic> fromStringToMap({required String value}) {
  Map<String, dynamic> map = json.decode(value);
  return map;
}

DataModel fromMapToDataModel({required Map<String, dynamic> map}) {
  int? id = map["id"];
  String? setup = map["setup"];
  String? delivery = map["delivery"];
  String? joke = map["joke"];

  return DataModel(id: id, setup: setup, delivery: delivery, joke: joke);
}
