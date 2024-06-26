import 'package:starkeep/core/notes/domain/entities/note.dart';

abstract class NotesLocalDataSource {
  Future<List<Note>> loadNotes();
}

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  @override
  Future<List<Note>> loadNotes() {
    // TODO: implement loadNotes
    throw UnimplementedError();
  }
}
