import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'animation_screen.dart';
import 'animation2_screen.dart';
import 'counter_screen.dart';

/////////// VARIABLES \\\\\\\\\\\\\
const text_style_header = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
);

const text_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
///////////////////////////////////

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: text_style_header,
              ),
              Text(
                "Number from counter Page: " +
                    watch(counterController.state).toString(),
                style: text_style,
              ),
              Text(
                "Complex animation1 box width: " +
                    watch(AdvanceController.state).width.toString(),
                style: text_style,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "PAGES",
                style: text_style,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/complex_animation1');
                },
                child: Text('Complex Animation1'),
                style: ElevatedButton.styleFrom(
                  // primary: watch(colorChangeProvider).customColor,
                  primary: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/complex_animation2');
                },
                child: Text('Complex Animation2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/counter_app');
                },
                child: Text('Counter'),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read(counterController).hypeNumber(99);
                },
                child: Text('Make counter number 99'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
