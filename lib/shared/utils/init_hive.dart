import 'package:hive_flutter/hive_flutter.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';

class InitHive {
  Future call() async {
    // Register
    Hive.registerAdapter(NoteAdapter());
    // Open boxes
    await Hive.openBox<Note>('notesBox');
  }
}
