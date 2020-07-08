import 'package:flutter/material.dart';
import './screens/home_page.dart';
import './screens/info_page.dart';
import 'package:page_transition/page_transition.dart';

// https://www.pharous.com/#about
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return PageTransition(
            child: HomePage(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 700));
      case '/Info':
        return PageTransition(
            child: InfoPage(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 700));
    }
  }
}
