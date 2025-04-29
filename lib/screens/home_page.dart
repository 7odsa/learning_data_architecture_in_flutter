import 'package:flutter/material.dart';
import 'package:learning_data_architecture_in_flutter/data/notifiers/notifiers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Everyday a New Joke to Make You Smile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: isConnectedNotifier,
                builder:
                    (context, value, child) => Container(
                      width: double.infinity,
                      height: 300,
                      child: Image.asset(
                        (value) ? "images/globe.png" : "images/no-signal.png",
                      ),
                    ),
              ),
              SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: dataNotifier,
                builder:
                    (context, value, child) => Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            (value.joke == null)
                                ? value.setup! + "\n\n" + value.delivery!
                                : value.joke!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () async {
          await dataNotifier.value.reset();
        },
        icon: Icon(Icons.next_plan, size: 56),
        label: Text("Next Joke"),
      ),
    );
  }
}
