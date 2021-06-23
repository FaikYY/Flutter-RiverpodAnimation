import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

///////////////// RIVERPOD STATE MANAGEMENT \\\\\\\\\\\\\\
final counterController =
    StateNotifierProvider<CounterNotifier>((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }

  void hypeNumber(arg) {
    state = arg;
  }
}
///////////////////////////////////////////////////

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Consumer(
              builder: (BuildContext context,
                  T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
                return Text(
                    "Number: " + watch(counterController.state).toString());
              },
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                context.read(counterController).add();
              },
            ),
            ElevatedButton(
              child: Text("Subtract"),
              onPressed: () {
                context.read(counterController).subtract();
              },
            )
          ],
        ),
      ),
    );
  }
}
