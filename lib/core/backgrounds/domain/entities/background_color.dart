import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BackgroundColor extends Equatable {
  final Color light;
  final Color dark;

  const BackgroundColor({required this.light, required this.dark});

  @override
  List<Object?> get props => [light, dark];
}
