import 'package:flutter/material.dart';

class CustomTheme {
  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      textTheme: textTheme,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.zero,
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff36618e),
        surfaceTint: Color(0xff36618e),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffd1e4ff),
        onPrimaryContainer: Color(0xff001d36),
        secondary: Color(0xff535f70),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffd7e3f7),
        onSecondaryContainer: Color(0xff101c2b),
        tertiary: Color(0xff6b5778),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xfff2daff),
        onTertiaryContainer: Color(0xff251431),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfff8f9ff),
        onSurface: Color(0xff191c20),
        onSurfaceVariant: Color(0xff43474e),
        outline: Color(0xff73777f),
        outlineVariant: Color(0xffc3c7cf),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2e3135),
        inversePrimary: Color(0xffa0cafd),
        primaryFixed: Color(0xffd1e4ff),
        onPrimaryFixed: Color(0xff001d36),
        primaryFixedDim: Color(0xffa0cafd),
        onPrimaryFixedVariant: Color(0xff194975),
        secondaryFixed: Color(0xffd7e3f7),
        onSecondaryFixed: Color(0xff101c2b),
        secondaryFixedDim: Color(0xffbbc7db),
        onSecondaryFixedVariant: Color(0xff3b4858),
        tertiaryFixed: Color(0xfff2daff),
        onTertiaryFixed: Color(0xff251431),
        tertiaryFixedDim: Color(0xffd6bee4),
        onTertiaryFixedVariant: Color(0xff523f5f),
        surfaceDim: Color(0xffd8dae0),
        surfaceBright: Color(0xfff8f9ff),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff2f3fa),
        surfaceContainer: Color(0xffeceef4),
        surfaceContainerHigh: Color(0xffe6e8ee),
        surfaceContainerHighest: Color(0xffe1e2e8),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      textTheme: textTheme,
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.zero,
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffa0cafd),
        surfaceTint: Color(0xffa0cafd),
        onPrimary: Color(0xff003258),
        primaryContainer: Color(0xff194975),
        onPrimaryContainer: Color(0xffd1e4ff),
        secondary: Color(0xffbbc7db),
        onSecondary: Color(0xff253140),
        secondaryContainer: Color(0xff3b4858),
        onSecondaryContainer: Color(0xffd7e3f7),
        tertiary: Color(0xffd6bee4),
        onTertiary: Color(0xff3b2948),
        tertiaryContainer: Color(0xff523f5f),
        onTertiaryContainer: Color(0xfff2daff),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surface: Color(0xff111418),
        onSurface: Color(0xffe1e2e8),
        onSurfaceVariant: Color(0xffc3c7cf),
        outline: Color(0xff8d9199),
        outlineVariant: Color(0xff43474e),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe1e2e8),
        inversePrimary: Color(0xff36618e),
        primaryFixed: Color(0xffd1e4ff),
        onPrimaryFixed: Color(0xff001d36),
        primaryFixedDim: Color(0xffa0cafd),
        onPrimaryFixedVariant: Color(0xff194975),
        secondaryFixed: Color(0xffd7e3f7),
        onSecondaryFixed: Color(0xff101c2b),
        secondaryFixedDim: Color(0xffbbc7db),
        onSecondaryFixedVariant: Color(0xff3b4858),
        tertiaryFixed: Color(0xfff2daff),
        onTertiaryFixed: Color(0xff251431),
        tertiaryFixedDim: Color(0xffd6bee4),
        onTertiaryFixedVariant: Color(0xff523f5f),
        surfaceDim: Color(0xff111418),
        surfaceBright: Color(0xff36393e),
        surfaceContainerLowest: Color(0xff0b0e13),
        surfaceContainerLow: Color(0xff191c20),
        surfaceContainer: Color(0xff1d2024),
        surfaceContainerHigh: Color(0xff272a2f),
        surfaceContainerHighest: Color(0xff32353a),
      ),
    );
  }
}
