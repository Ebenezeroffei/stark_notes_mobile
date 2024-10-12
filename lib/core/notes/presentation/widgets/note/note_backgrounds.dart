import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_background_colors.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class NoteBackgrounds extends StatelessWidget {
  final Note note;
  final void Function(Color? color) changeBackgroundColor;
  const NoteBackgrounds({
    super.key,
    required this.note,
    required this.changeBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Wrap(
        alignment: WrapAlignment.end,
        children: [
          NoteBackgroundColors(
            note: note,
            changeBackgroundColor: (Color? color) =>
                changeBackgroundColor(color),
          ),
        ],
      ).padY(20),
    ).padX(10);
  }
}
