import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:theme_provider/theme_provider.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final themeId = ThemeProvider.themeOf(context).id;
    Color? background;
    if (note.backgroundColor != null) {
      background = themeId == ThemesId.customDarkTheme
          ? note.backgroundColor?.dark
          : note.backgroundColor?.light;
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/note',
        arguments: note.id,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        constraints: const BoxConstraints(
          minHeight: 50.0,
          maxHeight: 200.0,
        ),
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            color: Colors.grey.withOpacity(0.8),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                note.content,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ).padB(10),
    );
  }
}
