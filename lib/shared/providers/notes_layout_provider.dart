import 'package:hooks_riverpod/hooks_riverpod.dart';

enum NotesLayout { row, column }

final providerOfNotesLayout = StateProvider<NotesLayout>(
  (ref) => NotesLayout.column,
);
