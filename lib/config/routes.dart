import 'package:flutter/material.dart';
import 'package:travelv2/main.dart';
import 'package:travelv2/screens/home.dart';
import 'package:travelv2/screens/article_page.dart';
import 'package:travelv2/screens/writer_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;


    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/article_page':
        if (args is Map) {
          return MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (_) => articlePage(
              datax: args,
            ),
          );
        }
        return _errorRoute();
      case '/writer_page':
        if (args is Map) {
          return MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (_) => writerPage(
                    writerInfo: args,
                  ));
        }
        return _errorRoute();
      default:
        return _errorRouteExplain();
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

Route<dynamic> _errorRouteExplain() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error not found route"),
      ),
      body: Center(
        child: Text('Error not found route'),
      ),
    );
  });
}
