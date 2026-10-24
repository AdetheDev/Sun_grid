import 'package:flutter/material.dart';
import 'package:my_first_project/pages/landing_page.dart';
import 'package:my_first_project/pages/signup_page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case '/' :
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/SignupPage':
      if (args is String) {
        return MaterialPageRoute(
          builder: (_) => SignupPage(
            
          ),
        );
      }

      return _errorRoute();
      default: 

      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder:  (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error')
        ),
        body: Center(
          child: Text('ERROR')
        ),
      );
    });
  }
}