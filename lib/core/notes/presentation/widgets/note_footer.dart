import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/presentation/widgets/note_options.dart';

class NoteFooter extends StatelessWidget {
  const NoteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.color_lens_outlined,
          ),
        ),
        IconButton(
          onPressed: () async => await showModalBottomSheet(
            context: context,
            builder: (context) => NoteOptions(),
          ),
          icon: const Icon(
            Icons.more_vert_rounded,
          ),
        ),
      ],
    );
  }
}
