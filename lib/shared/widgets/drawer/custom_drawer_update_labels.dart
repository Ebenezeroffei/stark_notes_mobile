import 'package:flutter/material.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class CustomDrawerUpdateLabels extends StatelessWidget {
  const CustomDrawerUpdateLabels({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Labels",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () async => Navigator.pushNamed(context, '/labels'),
          child: Text(
            "Edit",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    ).padL(15);
  }
}
