import 'package:flutter/material.dart';

class NoteTitle extends StatelessWidget {
  final TextEditingController controller;
  const NoteTitle({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      cursorWidth: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Title",
        hintStyle: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.secondary.withOpacity(0.5),
        ),
      ),
      maxLines: null,
      scrollPadding: EdgeInsets.zero,
      style: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
