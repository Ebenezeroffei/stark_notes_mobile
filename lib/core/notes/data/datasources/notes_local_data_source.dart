import 'package:hive_flutter/hive_flutter.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/shared/errors/exceptions.dart';

abstract class NotesLocalDataSource {
  Future<List<Note>> loadNotes();

  Future<Note> createNote({
    String? title = '',
    String? content = '',
  });

  Future<Note> updateNote({
    required String id,
    required String title,
    required String content,
  });
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

  @override
  Future<Note> createNote({String? title = '', String? content = ''}) async {
    try {
      final Box notes = Hive.box<Note>('notesBox');
      final note = Note(title: title ?? '', content: content ?? '');
      await notes.put(note.id, note);
      return note;
    } catch (e) {
      throw CacheException("There was a problem creating a note");
    }
  }

  @override
  Future<Note> updateNote(
      {required String id,
      required String title,
      required String content}) async {
    try {
      final notes = Hive.box<Note>('notesBox');
      final oldNote = notes.get(id);
      final updatedNote = oldNote?.update(title: title, content: content);
      if (updatedNote != null) {
        await notes.put(id, updatedNote);
        return updatedNote;
      }
      throw CacheException("The note doesn't exist.");
    } on CacheException catch (e) {
      throw CacheException(e.message);
    } catch (e) {
      throw CacheException("There was a problem saving the note");
    }
  }
}
