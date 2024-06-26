import 'package:dartz/dartz.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/domain/repositories/note_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class LoadNotes {
  final NotesRepository _repository;

  LoadNotes(this._repository);

  Future<Either<Failure, List<Note>>> execute() async {
    return await _repository.loadNotes();
  }
}
