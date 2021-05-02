import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';

final initialValue =
    Properties(250.0, 250.0, Colors.blue, BorderRadius.circular(5));

final AdvanceController = StateNotifierProvider<AdvanceNotifier>((ref) {
  return AdvanceNotifier(initialValue);
});

class Properties {
  double width;
  double height;
  Color customColor;
  BorderRadiusGeometry borderRadius; //BorderRadius.circular(8)
  Properties(this.height, this.width, this.customColor, this.borderRadius);
}

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
