import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_example/providers.dart';
import 'providers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('parent has been built');
    return Scaffold(
      appBar: AppBar(title: Text("Riverpod Simplified")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, watch, child) {
                final properteis = watch(AdvanceController.state);
                return AnimatedContainer(
                  width: properteis.width,
                  height: properteis.height,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: properteis.customColor,
                    borderRadius: properteis.borderRadius,
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: Text("Change"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                context.read(AdvanceController).changeShape();
              },
            ),
            ElevatedButton(
              child: Text("Default"),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                context.read(AdvanceController).changeDefault();
              },
            ),
          ],
        ),
      ),
    );
  }
}
