import 'package:flutter/material.dart';
import 'package:starkeep/core/backgrounds/domain/data/local_datasource/background_colors_local_datasource.dart';
import 'package:starkeep/core/backgrounds/domain/entities/background_color.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:theme_provider/theme_provider.dart';

class NoNoteBackgroundColor extends StatelessWidget {
  const NoNoteBackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Icon(
        Icons.format_color_reset_outlined,
      ),
    ).padR(15);
  }
}

class NoteBackgroundColor extends StatelessWidget {
  final BackgroundColor color;

  const NoteBackgroundColor({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final themeId = ThemeProvider.themeOf(context).id;

    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: themeId == ThemesId.customDarkTheme ? color.dark : color.light,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    ).padR(15);
  }
}

class NoteBackgroundColors extends StatelessWidget {
  const NoteBackgroundColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Color",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const NoNoteBackgroundColor(),
              ...backgroundColors
                  .map((color) => NoteBackgroundColor(color: color)),
            ],
          ),
        )
      ],
    );
  }
}
