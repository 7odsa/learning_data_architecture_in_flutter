import 'package:learning_data_architecture_in_flutter/data/notifiers/notifiers.dart';
import 'package:learning_data_architecture_in_flutter/data/shared_pref.dart';
import 'package:learning_data_architecture_in_flutter/functions/manage_data.dart';
import 'package:learning_data_architecture_in_flutter/functions/utils.dart';

Map<String, dynamic> _currentDataMap = {};

Future<void> setDataNotifier() async {
  if (isConnectedNotifier.value) {
    _currentDataMap = await getExternalData();
  } else {
    _currentDataMap = await getInternalData();
  }

  if (_currentDataMap.isNotEmpty) {
    dataNotifier.value = fromMapToDataModel(map: _currentDataMap);
  }
}
