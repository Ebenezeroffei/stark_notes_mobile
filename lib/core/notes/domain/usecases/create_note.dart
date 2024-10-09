import 'package:dartz/dartz.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/domain/repositories/note_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class CreateNote {
  final NotesRepository _repository;

  CreateNote(this._repository);

  Future<Either<Failure, Note>> execute(
          {String? title = '', String? content = ''}) =>
      _repository.createNote(
        title: title,
        content: content,
      );
}
