import 'package:learning_data_architecture_in_flutter/functions/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPref sharedPref = SharedPref();

class SharedPref {
  late SharedPreferences _instance;

  late Map<String, dynamic> data;

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
    await getData();
  }

  Future<void> getData() async {
    final String jsonString =
        _instance.getString("kData") ?? await saveInternalData();
    final map = fromStringToMap(value: jsonString);
    data = map;
  }

  Future<String> saveInternalData({String jsonString = "{}"}) async {
    String jsonStringInitValue = jsonString;
    await _instance.setString("kData", jsonStringInitValue);
    return jsonStringInitValue;
  }
}
