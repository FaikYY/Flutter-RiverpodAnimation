import 'package:flutter/material.dart';
import 'package:simple_example/screen/animation2_screen.dart';
import 'package:simple_example/screen/animation_screen.dart';
import '../screen/home_screen.dart';
import '../screen/counter_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/complex_animation1':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => AnimationScreen(),
        );
        return _errorRoute();
      case '/counter_app':
        return (MaterialPageRoute(
          builder: (_) => CounterScreen(),
        ));
      case '/complex_animation2':
        return (MaterialPageRoute(
          builder: (_) => Animation2Screen(),
        ));
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
