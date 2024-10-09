import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/labels/presentation/pages/labels_page.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/pages/home_page.dart';
import 'package:starkeep/core/notes/presentation/pages/note.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return goTo(const HomePage());
      case '/note':
        if (settings.arguments is String) {
          final notesId = settings.arguments;
          final Box notes = Hive.box<Note>('notesBox');
          final note = notes.get(notesId);
          return goTo(NoteForm(
            note: note,
          ));
        }
        return goTo(Scaffold());
      case '/labels':
        return goTo(const LabelsPage());
      default:
        return goTo(Scaffold());
    }
  }

  static Route<MaterialPageRoute> goTo(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
