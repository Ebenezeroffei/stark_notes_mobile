import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomDrawerThemeSelect extends ConsumerWidget {
  const CustomDrawerThemeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeProvider = ThemeProvider.themeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dark Theme",
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch.adaptive(
          value: themeProvider.id == ThemesId.customDarkTheme,
          onChanged: (bool value) =>
              ThemeProvider.controllerOf(context).setTheme(
            value ? ThemesId.customDarkTheme : ThemesId.customLightTheme,
          ),
        ),
      ],
    ).padT(5).padL(15);
  }
}
