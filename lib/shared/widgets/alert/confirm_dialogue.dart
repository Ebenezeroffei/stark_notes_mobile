import 'package:flutter/material.dart';

class ConfirmDialogue extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onYesResponse;

  const ConfirmDialogue({
    super.key,
    required this.title,
    required this.content,
    required this.onYesResponse,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(
        content,
        style: theme.textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: onYesResponse,
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("No"),
        )
      ],
    );
  }
}
