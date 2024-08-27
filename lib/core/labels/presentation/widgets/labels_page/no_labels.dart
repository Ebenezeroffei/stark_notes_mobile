import 'package:flutter/material.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class NoLabels extends StatelessWidget {
  const NoLabels({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.label_outline,
            size: 50,
            color: Colors.grey.shade600,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "No Labels",
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ).padY(40),
    );
  }
}
