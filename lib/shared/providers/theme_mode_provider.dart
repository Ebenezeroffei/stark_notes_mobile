import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfThemeMode = StateProvider<ThemeMode>((ref) => ThemeMode.light);
