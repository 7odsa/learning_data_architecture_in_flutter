import 'package:learning_data_architecture_in_flutter/data/notifiers/manage_notifiers.dart';

class DataModel {
  final int? id;
  final String? setup;
  final String? delivery;
  final String? joke;

  DataModel({
    required this.id,
    required this.setup,
    required this.delivery,
    required this.joke,
  });

  Future<void> reset() async {
    await setDataNotifier();
  }

  void logData() {
    // TODO
  }
}
