import 'package:flutter/material.dart';
import 'package:starkeep/core/backgrounds/domain/data/local_datasource/background_colors_local_datasource.dart';
import 'package:starkeep/core/backgrounds/domain/entities/background_color.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/utils/notes_utils.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:theme_provider/theme_provider.dart';

class NoNoteBackgroundColor extends StatelessWidget {
  final Note note;
  final BackgroundColor? background;
  final void Function(Color? color) changeBackgroundColor;
  final void Function(BackgroundColor? color) selectBackgroundColor;

  const NoNoteBackgroundColor({
    super.key,
    required this.note,
    required this.changeBackgroundColor,
    this.background,
    required this.selectBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isSelected = background == null;

    return GestureDetector(
      onTap: () => NotesUtils.updateNoteBackgroundColor(
        selectBackgroundColor: (BackgroundColor? background) =>
            selectBackgroundColor(background),
        changeBackgroundColor: (Color? color) => changeBackgroundColor(color),
        note: note,
      ),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: isSelected
              ? Border.all(
                  color: theme.colorScheme.primary,
                  width: 3,
                )
              : Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: isSelected
            ? Icon(
                Icons.done,
                color: theme.colorScheme.primary,
                size: 30,
              )
            : const Icon(
                Icons.format_color_reset_outlined,
              ),
      ).padR(15),
    );
  }
}

class NoteBackgroundColor extends StatelessWidget {
  final Note note;
  final BackgroundColor color;
  final BackgroundColor? background;
  final void Function(Color? color) changeBackgroundColor;
  final void Function(BackgroundColor? color) selectBackgroundColor;

  const NoteBackgroundColor({
    super.key,
    required this.color,
    required this.note,
    required this.changeBackgroundColor,
    this.background,
    required this.selectBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeId = ThemeProvider.themeOf(context).id;
    final theme = Theme.of(context);
    bool isSelected = background == color ? true : false;

    return GestureDetector(
      onTap: () => NotesUtils.updateNoteBackgroundColor(
          selectBackgroundColor: (BackgroundColor? background) =>
              selectBackgroundColor(background),
          changeBackgroundColor: (Color? color) => changeBackgroundColor(color),
          note: note,
          color: color,
          themeId: themeId),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: themeId == ThemesId.customDarkTheme ? color.dark : color.light,
          border: isSelected
              ? Border.all(
                  color: theme.colorScheme.primary,
                  width: 3,
                )
              : Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: isSelected
            ? Icon(
                Icons.done,
                color: theme.colorScheme.primary,
                size: 30,
              )
            : null,
      ).padR(15),
    );
  }
}

class NoteBackgroundColors extends StatefulWidget {
  final Note note;
  final void Function(Color? color) changeBackgroundColor;

  const NoteBackgroundColors({
    super.key,
    required this.note,
    required this.changeBackgroundColor,
  });

  @override
  State<NoteBackgroundColors> createState() => _NoteBackgroundColorsState();
}

class _NoteBackgroundColorsState extends State<NoteBackgroundColors> {
  BackgroundColor? _background;

  @override
  void initState() {
    super.initState();
    setState(() {
      _background = widget.note.backgroundColor;
    });
  }

  void selectBackgroundColor(BackgroundColor? background) => setState(() {
        _background = background;
      });

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
              NoNoteBackgroundColor(
                selectBackgroundColor: (BackgroundColor? background) =>
                    selectBackgroundColor(background),
                background: _background,
                note: widget.note,
                changeBackgroundColor: (Color? color) =>
                    widget.changeBackgroundColor(color),
              ),
              ...backgroundColors.map(
                (color) => NoteBackgroundColor(
                  selectBackgroundColor: (BackgroundColor? background) =>
                      selectBackgroundColor(background),
                  background: _background,
                  color: color,
                  note: widget.note,
                  changeBackgroundColor: (Color? color) =>
                      widget.changeBackgroundColor(color),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
