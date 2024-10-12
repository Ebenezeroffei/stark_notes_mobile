import 'package:dartz/dartz.dart';
import 'package:starkeep/core/backgrounds/domain/entities/background_color.dart';
import 'package:starkeep/core/notes/data/datasources/notes_local_data_source.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/domain/repositories/note_repository.dart';
import 'package:starkeep/shared/errors/exceptions.dart';
import 'package:starkeep/shared/errors/failure.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDataSource _localDataSource;

  NotesRepositoryImpl({required NotesLocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, Note>> createNote(
      {String? title = '', String? content = ''}) async {
    try {
      final note = await _localDataSource.createNote(
        title: title,
        content: content,
      );
      return Right(note);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> loadNotes() async {
    try {
      final notes = await _localDataSource.loadNotes();
      return Right(notes);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Note>> updateNote({
    required String id,
    required String title,
    required String content,
    BackgroundColor? backgroundColor,
  }) async {
    try {
      final updatedNote = await _localDataSource.updateNote(
        id: id,
        title: title,
        content: content,
        backgroundColor: backgroundColor,
      );
      return Right(updatedNote);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
