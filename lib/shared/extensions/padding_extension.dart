import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Padding pad(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding padT(double value) => Padding(
        padding: EdgeInsets.only(top: value),
        child: this,
      );

  Padding padB(double value) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: this,
      );

  Padding padR(double value) => Padding(
        padding: EdgeInsets.only(right: value),
        child: this,
      );

  Padding padL(double value) => Padding(
        padding: EdgeInsets.only(left: value),
        child: this,
      );

  Padding padX(double value) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Padding padY(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );
}
