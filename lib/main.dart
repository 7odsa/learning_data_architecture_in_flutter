import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:learning_data_architecture_in_flutter/data/dio.dart';
import 'package:learning_data_architecture_in_flutter/data/notifiers/notifiers.dart';
import 'package:learning_data_architecture_in_flutter/functions/init.dart';
import 'package:learning_data_architecture_in_flutter/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late StreamSubscription<List<ConnectivityResult>> subscription;
  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.none)) {
        isConnectedNotifier.value = false;
        print("no internet");
      } else {
        isConnectedNotifier.value = true;

        getHttp();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: FutureBuilder(
        future: initApp(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Scaffold(body: Center(child: CircularProgressIndicator()))
              : const HomePage();
        },
      ),
    );
  }
}
