import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/widgets/home_page/note_item.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = Hive.box<Note>('notesBox');

    return ValueListenableBuilder(
      valueListenable: notes.listenable(),
      builder: (_, box, __) {
        return ListView.builder(
          itemBuilder: (_, index) {
            final note = box.values.toList()[index];
            return NoteItem(note: note);
          },
          shrinkWrap: true,
          itemCount: box.values.length,
        );
      },
    ).pad(10);
  }
}
