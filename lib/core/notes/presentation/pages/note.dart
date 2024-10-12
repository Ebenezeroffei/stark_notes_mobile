import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/utils/notes_utils.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_content.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_footer.dart';
import 'package:starkeep/core/notes/presentation/widgets/note/note_title.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
import 'package:theme_provider/theme_provider.dart';

class NoteForm extends StatefulWidget {
  final String noteId;

  const NoteForm({super.key, required this.noteId});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _noteTitle = TextEditingController();
  final _noteContent = TextEditingController();
  Color? _background;

  void _changeBackgroundColor(Color? color) {
    setState(() {
      _background = color;
    });
  }

  @override
  void initState() {
    super.initState();
    final notes = Hive.box<Note>('notesBox');
    final note = notes.get(widget.noteId);
    if (note != null) {
      _noteTitle.text = note.title;
      _noteContent.text = note.content;

      _noteTitle.addListener(
        () => NotesUtils.updateNote(
          content: _noteContent.text,
          title: _noteTitle.text,
          id: note.id,
        ),
      );
      _noteContent.addListener(
        () => NotesUtils.updateNote(
          content: _noteContent.text,
          title: _noteTitle.text,
          id: note.id,
        ),
      );
    }
  }

  @override
  void dispose() {
    _noteTitle.dispose();
    _noteContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notes = Hive.box<Note>('notesBox');
    final note = notes.get(widget.noteId);

    final themeId = ThemeProvider.themeOf(context).id;
    if (note != null) {
      if (note.backgroundColor != null) {
        _background = themeId == ThemesId.customDarkTheme
            ? note.backgroundColor?.dark
            : note.backgroundColor?.light;
      }
    }

    return Scaffold(
      backgroundColor: _background,
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
          if (note != null)
            NoteFooter(
              note: note,
              changeBackgroundColor: (Color? color) =>
                  _changeBackgroundColor(color),
            )
        ],
      ),
    );
  }
}
