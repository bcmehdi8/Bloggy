import 'package:flutter/material.dart';
import 'package:travelv2/main.dart';
import 'package:travelv2/screens/home.dart';
import 'package:travelv2/screens/article_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/article_page':
        if (args is String) {
          return MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (_) => articlePage(
                //data: args,
                ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  });
}
