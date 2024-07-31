import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Center toCenter() => Center(
        child: this,
      );

  Align toLeft() => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  Align toRight() => Align(
        alignment: Alignment.centerRight,
        child: this,
      );
}
