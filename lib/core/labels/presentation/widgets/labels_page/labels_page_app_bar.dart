import 'package:flutter/material.dart';

class LabelsPageAppBar extends StatelessWidget {
  const LabelsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.colorScheme.onPrimary,
      floating: true,
      snap: true,
      title: Text(
        "Edit labels",
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
