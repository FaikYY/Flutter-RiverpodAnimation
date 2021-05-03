import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';

//////////// RIVERPOD STATE MANAGEMENT SECTION \\\\\\\\\\
final initialValue =
    ColorChangeNotifier(250.0, 250.0, Colors.blue, BorderRadius.circular(5));

////// Initialize the provider and its values
final colorChangeProvider = ChangeNotifierProvider<ColorChangeNotifier>((ref) {
  return initialValue;
});

////// Define a class to change its values afterwards
class ColorChangeNotifier extends ChangeNotifier {
  double width;
  double height;
  Color customColor;
  BorderRadiusGeometry borderRadius; //BorderRadius.circular(8)

  ColorChangeNotifier(
      this.width, this.height, this.customColor, this.borderRadius);

  void changeWidth(arg) {
    width = arg;
    notifyListeners();
  }

  void changeWidthDefault() {
    width = 30.0;
    notifyListeners();
  }

  void changeCustomColor() {
    customColor = Colors.orange;
    notifyListeners();
  }
}

////// Define the state management and its methods
////// We use this to access the boiler plate class, its variables and its methods from anywhere
class ColorStateNotifier extends StateNotifier<ColorChangeNotifier> {
  ColorStateNotifier(ColorChangeNotifier properties)
      : super(properties ?? initialValue); // initialize the value
}
///////////////////////////////////////////////////////////

class ComplexAnimation2 extends StatelessWidget {
  const ComplexAnimation2({
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
                final properteis = watch(colorChangeProvider);
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
                // since we use changeNotifer, we are able to
                //change spesific values without recreating the whole class
                // !! unlike StateNotifierProvider !!
                context.read(colorChangeProvider).changeWidth(400.0);
              },
            ),
            ElevatedButton(
              child: Text("Default"),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                context.read(colorChangeProvider).changeWidthDefault();
              },
            ),
            ElevatedButton(
              child: Text("Change color"),
              style: ElevatedButton.styleFrom(primary: Colors.orange),
              onPressed: () {
                context.read(colorChangeProvider).changeCustomColor();
              },
            ),
          ],
        ),
      ),
    );
  }
}
