import 'package:flutter/material.dart';
import 'complex_animation.dart';
import 'home.dart';
import 'counter.dart';
import 'complex_animation2.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/complex_animation1':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => ComplexAnimation(),
        );
        return _errorRoute();
      case '/counter_app':
        return (MaterialPageRoute(
          builder: (_) => CounterApp(),
        ));
      case '/complex_animation2':
        return (MaterialPageRoute(
          builder: (_) => ComplexAnimation2(),
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
