import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/presentation/pages/home/home_page.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return goTo(const HomePage());
      default:
        return goTo(Scaffold());
    }
  }

  static Route<MaterialPageRoute> goTo(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
