import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/utils/notes_utils.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_content.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_footer.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_title.dart';

class NoteForm extends StatefulWidget {
  final Note note;

  const NoteForm({super.key, required this.note});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _noteTitle = TextEditingController();
  final _noteContent = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteTitle.text = widget.note.title;
    _noteContent.text = widget.note.content;

    _noteTitle.addListener(
      () => NotesUtils.updateNote(
        content: _noteContent.text,
        title: _noteTitle.text,
        id: widget.note.id,
      ),
    );
    _noteContent.addListener(
      () => NotesUtils.updateNote(
        content: _noteContent.text,
        title: _noteTitle.text,
        id: widget.note.id,
      ),
    );
  }

  @override
  void dispose() {
    _noteTitle.dispose();
    _noteContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.note.id);
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
          const NoteFooter()
        ],
      ),
    );
  }
}
