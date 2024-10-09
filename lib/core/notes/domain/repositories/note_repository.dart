import 'package:dartz/dartz.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/shared/errors/failure.dart';

abstract class NotesRepository {
  Future<Either<Failure, List<Note>>> loadNotes();

  Future<Either<Failure, Note>> createNote({
    String? title = '',
    String? content = '',
  });

  Future<Either<Failure, Note>> updateNote({
    required String id,
    required String title,
    required String content,
  });
}
