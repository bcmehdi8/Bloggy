import 'package:flutter/material.dart';
import 'package:travelv2/config/routes.dart';
import 'screens/home.dart';
import 'config/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final createMaterialColor = CreateMaterialColor();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            createMaterialColor.createMaterialColor(Color(0xFF0C9869)),
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
     // home: Home(),
    );
  }
}
