import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:starkeep/shared/providers/theme_mode_provider.dart';

class CustomDrawerThemeSelect extends ConsumerWidget {
  const CustomDrawerThemeSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(providerOfThemeMode);

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
          value: themeMode == ThemeMode.dark,
          onChanged: (bool value) => themeMode == ThemeMode.dark
              ? ref.read(providerOfThemeMode.notifier).state = ThemeMode.light
              : ref.read(providerOfThemeMode.notifier).state = ThemeMode.dark,
        ),
      ],
    ).padT(5).padL(15);
  }
}
