import 'package:dartz/dartz.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/domain/repositories/note_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class UpdateNote {
  final NotesRepository _repository;

  UpdateNote(this._repository);

  Future<Either<Failure, Note>> execute({
    required String id,
    required String title,
    required String content,
  }) async =>
      await _repository.updateNote(id: id, title: title, content: content);
}
