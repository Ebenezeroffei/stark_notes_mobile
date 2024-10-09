import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_background_colors.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class NoteBackgrounds extends StatelessWidget {
  const NoteBackgrounds({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Wrap(
        alignment: WrapAlignment.end,
        children: [
          NoteBackgroundColors(),
        ],
      ).padY(20),
    ).padX(10);
  }
}
