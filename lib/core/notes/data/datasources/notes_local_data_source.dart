import 'package:hive_flutter/hive_flutter.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/shared/errors/exceptions.dart';

abstract class NotesLocalDataSource {
  Future<List<Note>> loadNotes();
}

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  @override
  Future<List<Note>> loadNotes() async {
    try {
      final Box notes = Hive.box<Note>('notesBox');
      return notes.values as List<Note>;
    } catch (e) {
      throw CacheException("Unable to load notes");
    }
  }
}
