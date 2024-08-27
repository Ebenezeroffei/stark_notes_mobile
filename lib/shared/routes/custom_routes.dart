import 'package:flutter/material.dart';
import 'package:starkeep/core/labels/presentation/pages/labels_page.dart';
import 'package:starkeep/core/notes/presentation/pages/home_page.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return goTo(const HomePage());
      case '/labels':
        return goTo(const LabelsPage());
      default:
        return goTo(Scaffold());
    }
  }

  static Route<MaterialPageRoute> goTo(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
