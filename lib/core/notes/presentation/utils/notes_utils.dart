import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/data/datasources/notes_local_data_source.dart';
import 'package:starkeep/core/notes/data/repositories/notes_repository_impl.dart';
import 'package:starkeep/core/notes/domain/usecases/create_note.dart';
import 'package:starkeep/core/notes/domain/usecases/update_note.dart';
import 'package:starkeep/shared/toasts/toast.dart';

class NotesUtils {
  static void createNote(
    BuildContext context,
  ) async {
    final notesLocalDataSource = NotesLocalDataSourceImpl();
    final repository =
        NotesRepositoryImpl(localDataSource: notesLocalDataSource);
    final usecase = CreateNote(repository);
    final res = await usecase.execute();
    res.fold(
      (e) => Toast.error(e.message),
      (note) => Navigator.pushNamed(context, '/note', arguments: note.id),
    );
  }

  static void updateNote({
    required String id,
    required String title,
    required String content,
  }) async {
    final notesLocalDataSource = NotesLocalDataSourceImpl();
    final repository =
        NotesRepositoryImpl(localDataSource: notesLocalDataSource);
    final usecase = UpdateNote(repository);
    final res = await usecase.execute(id: id, title: title, content: content);
    res.fold((l) => Toast.error(l.message), (updatedNote) {});
  }
}
