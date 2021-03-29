import 'package:dukan_app/screens/khata_screen.dart';
import 'package:dukan_app/widgets/khata/add_khata.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // getting all aguments passed during Navigator.pushnamed.
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => KhataScreen());
      case '/AddKhata':
        return MaterialPageRoute(builder: (_) => AddKhata());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error!'),
        ),
        body: Center(
          child: Text('Error!'),
        ),
      );
    });
  }
}
