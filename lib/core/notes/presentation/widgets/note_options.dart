import 'package:flutter/material.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class NoteOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  const NoteOption(
      {super.key, required this.icon, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: theme.colorScheme.secondary,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: theme.colorScheme.secondary,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NoteOptions extends StatelessWidget {
  const NoteOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: true,
      onClosing: () {},
      builder: (context) => Wrap(
        children: [
          NoteOption(icon: Icons.delete_outline, title: "Delete"),
          NoteOption(icon: Icons.content_copy_outlined, title: "Make a copy"),
          NoteOption(icon: Icons.share_outlined, title: "Send"),
          NoteOption(
            icon: Icons.label_outline,
            title: "Labels",
            onPressed: () async => Navigator.pushNamed(context, '/labels'),
          ),
        ],
      ),
    ).pad(10);
  }
}
