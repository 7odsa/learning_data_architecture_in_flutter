import 'package:flutter/material.dart';
import 'package:learning_data_architecture_in_flutter/models/data_model.dart';

ValueNotifier<DataModel> dataNotifier = ValueNotifier(
  DataModel(id: 0, setup: "setup", delivery: "delivery", joke: 'NO joke'),
);

ValueNotifier<bool> isConnectedNotifier = ValueNotifier(false);
