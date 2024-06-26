import 'package:flutter/material.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return goTo(Scaffold());
  }

  static Route<MaterialPageRoute> goTo(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
