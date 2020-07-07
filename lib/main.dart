import 'package:flutter/material.dart';
import './route.dart';
import 'screens/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
          bottomAppBarColor: Color(0xFFF6F7FB)),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: UsingAnimationControllerPage(),
    );
  }
}
