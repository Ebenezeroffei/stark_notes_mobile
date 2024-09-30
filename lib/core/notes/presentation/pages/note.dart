import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/presentation/widgets/note_content.dart';
import 'package:starkeep/core/notes/presentation/widgets/note_footer.dart';
import 'package:starkeep/core/notes/presentation/widgets/note_title.dart';

class NoteForm extends StatelessWidget {
  NoteForm({super.key});

  final _noteTitle = TextEditingController();
  final _noteContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.push_pin_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.archive,
            ),
          ),
        ],
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                NoteTitle(
                  controller: _noteTitle,
                ),
                NoteContent(
                  controller: _noteContent,
                ),
              ],
            ),
          ),
          NoteFooter()
        ],
      ),
    );
  }
}
