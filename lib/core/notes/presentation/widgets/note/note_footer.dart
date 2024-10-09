import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_backgrounds.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_options.dart';

class NoteFooter extends StatelessWidget {
  const NoteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () async => await showModalBottomSheet(
            context: context,
            builder: (context) => NoteBackgrounds(),
          ),
          icon: const Icon(
            Icons.color_lens_outlined,
          ),
        ),
        IconButton(
          onPressed: () async => await showModalBottomSheet(
            context: context,
            builder: (context) => const NoteOptions(),
          ),
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ],
    );
  }
}
