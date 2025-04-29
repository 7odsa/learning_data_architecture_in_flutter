import 'package:learning_data_architecture_in_flutter/data/dio.dart';
import 'package:learning_data_architecture_in_flutter/data/shared_pref.dart';
import 'package:learning_data_architecture_in_flutter/functions/utils.dart';

Future<Map<String, dynamic>> getExternalData() async {
  final response = await getHttp();

  String jsonString = fromMapToString(map: response);

  await saveNewInternalData(jsonString: jsonString);

  return response;
}

Future<void> saveNewInternalData({required String jsonString}) async {
  sharedPref.saveInternalData(jsonString: jsonString);
}

Future<Map<String, dynamic>> getInternalData() async {
  await sharedPref.getData();
  final map = sharedPref.data;
  return map;
}
