import 'package:hive_flutter/hive_flutter.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';

class InitHive {
  Future call() async {
    // Register adapters
    Hive.registerAdapter(NoteAdapter());
    Hive.registerAdapter(LabelAdapter());
    // Open boxes
    await Hive.openBox<Note>('notesBox');
    await Hive.openBox<Label>('labelsBox');
  }
}
