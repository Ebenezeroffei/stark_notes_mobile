import 'package:flutter/material.dart';

class NoteContent extends StatelessWidget {
  final TextEditingController controller;
  NoteContent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      cursorWidth: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Note",
        hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: theme.colorScheme.secondary.withOpacity(0.5)),
      ),
      minLines: 2,
      maxLines: null,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}
