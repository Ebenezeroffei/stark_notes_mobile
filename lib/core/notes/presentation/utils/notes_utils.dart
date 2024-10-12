import 'package:flutter/material.dart';
import 'package:starkeep/core/backgrounds/domain/entities/background_color.dart';
import 'package:starkeep/core/notes/data/datasources/notes_local_data_source.dart';
import 'package:starkeep/core/notes/data/repositories/notes_repository_impl.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/domain/usecases/create_note.dart';
import 'package:starkeep/core/notes/domain/usecases/update_note.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
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

  static void updateNoteBackgroundColor({
    BackgroundColor? color,
    String? themeId,
    required Note note,
    required void Function(Color? color) changeBackgroundColor,
    required void Function(BackgroundColor? background) selectBackgroundColor,
  }) async {
    final notesLocalDataSource = NotesLocalDataSourceImpl();
    final repository =
        NotesRepositoryImpl(localDataSource: notesLocalDataSource);
    final usecase = UpdateNote(repository);
    final res = await usecase.execute(
      id: note.id,
      title: note.title,
      content: note.content,
      backgroundColor: color,
    );
    res.fold(
      (l) => Toast.error(l.message),
      (updatedNote) {
        // Change for the scaffold
        color != null && themeId != null
            ? changeBackgroundColor(
                themeId == ThemesId.customDarkTheme ? color.dark : color.light)
            : changeBackgroundColor(null);
        // For the modal
        selectBackgroundColor(color);
      },
    );
  }
}
