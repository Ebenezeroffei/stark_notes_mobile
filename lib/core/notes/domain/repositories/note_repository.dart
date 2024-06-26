import 'package:dartz/dartz.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/shared/errors/failure.dart';

abstract class NotesRepository {
  Future<Either<Failure, List<Note>>> loadNotes();
}
