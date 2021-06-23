import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

/////////////////// RIVERPOD STATE MANAGEMENT \\\\\\\\\\\\\\\\
final initialValue =
    Properties(250.0, 250.0, Colors.blue, BorderRadius.circular(5));

////// initialize the values and provider itself
final AdvanceController = StateNotifierProvider<AdvanceNotifier>((ref) {
  return AdvanceNotifier(initialValue);
});

////// create the boiler plate class
class Properties {
  double width;
  double height;
  Color customColor;
  BorderRadiusGeometry borderRadius; //BorderRadius.circular(8)
  Properties(this.height, this.width, this.customColor, this.borderRadius);
}

////// create the state management to access and change the classes value
////// from anywhere
///
///.. NOTE: One handicap of using StateNotifier is that we are creating the
///.. whole class again and again
/// TODO: check if there is solution for that
class AdvanceNotifier extends StateNotifier<Properties> {
  AdvanceNotifier(Properties properties)
      : super(properties ?? initialValue); // initialize the value

  void changeShape() {
    state = Properties(50.0, 50.0, Colors.red, BorderRadius.circular(50));
  }

  void changeDefault() {
    state = initialValue;
  }
}
///////////////////////////////

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Complex Animation")),
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
