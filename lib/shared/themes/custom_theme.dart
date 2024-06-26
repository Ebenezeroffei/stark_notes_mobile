import 'package:flutter/material.dart';

class CustomTheme {
  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(fontSize: 32, height: 40),
    titleLarge: TextStyle(fontSize: 24, height: 32),
    titleMedium: TextStyle(fontSize: 16, height: 24),
    titleSmall: TextStyle(fontSize: 14, height: 20),
    bodyLarge: TextStyle(fontSize: 14, height: 20),
    bodyMedium: TextStyle(fontSize: 12, height: 16),
    bodySmall: TextStyle(fontSize: 10, height: 14),
  );

  static ThemeData light() {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.resolveWith(
            (states) => const BorderSide(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          textStyle:
              MaterialStateProperty.resolveWith((states) => const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
          shape: MaterialStateProperty.resolveWith(
            (states) => const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 3,
        shadowColor: Colors.black26,
        surfaceTintColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      textTheme: textTheme,
      colorScheme: ColorScheme.dark(
        primary: Colors.blue,
        surface: Colors.grey.shade900,
        surfaceTint: Colors.black,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          side: MaterialStateProperty.resolveWith(
            (states) => const BorderSide(
              width: 0.5,
              color: Colors.grey,
            ),
          ),
          textStyle:
              MaterialStateProperty.resolveWith((states) => const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
          shape: MaterialStateProperty.resolveWith(
            (states) => const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 3,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
