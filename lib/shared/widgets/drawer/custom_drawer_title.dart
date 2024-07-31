import 'package:flutter/material.dart';

class CustomDrawerTitle extends StatelessWidget {
  const CustomDrawerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: "Stark ",
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
        children: [
          TextSpan(
            text: "Notes",
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
