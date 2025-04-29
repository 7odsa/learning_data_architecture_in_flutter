import 'package:learning_data_architecture_in_flutter/data/notifiers/manage_notifiers.dart';
import 'package:learning_data_architecture_in_flutter/data/shared_pref.dart';

Future<void> initApp() async {
  await initSharedPref();
  await initDataNotifier();
}

Future<void> initSharedPref() async {
  await sharedPref.init();
}

Future<void> initDataNotifier() async {
  await setDataNotifier();
}
