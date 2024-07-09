import 'dart:js_util';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:starkeep/core/notes/data/datasources/notes_local_data_source.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:mockito/mockito.dart';
import 'package:starkeep/shared/errors/exceptions.dart';

import 'notes_local_data_source_test.mocks.dart';

class FakeNote extends Fake implements Note {}

final List<FakeNote> fakeNotes = [
  FakeNote(),
  FakeNote(),
  FakeNote(),
  FakeNote(),
  FakeNote(),
  FakeNote(),
];

@GenerateNiceMocks([MockSpec<NotesLocalDataSourceImpl>()])
void main() {
  late MockNotesLocalDataSourceImpl mockNotesLocalDataSourceImpl;
  late NotesLocalDataSourceImpl notesLocalDataSource;

  setUp(() {
    mockNotesLocalDataSourceImpl = MockNotesLocalDataSourceImpl();
    notesLocalDataSource = NotesLocalDataSourceImpl();
  });

  test(
    "Should return a list of notes",
    () async {
      // arrange
      when(mockNotesLocalDataSourceImpl.loadNotes())
          .thenAnswer((realInvocation) async => fakeNotes);
      // // act
      final results = await notesLocalDataSource.loadNotes();
      // // assert
      expect(results, equals(fakeNotes));
      verify(mockNotesLocalDataSourceImpl.loadNotes());
    },
  );

  test("Should throw an error when the list of notes cannot be found",
      () async {
    // arrange
    when(mockNotesLocalDataSourceImpl.loadNotes())
        .thenThrow(CacheException("Unable to load notes"));
    // // act
    final results = await notesLocalDataSource.loadNotes();
    // // assert
    expect(results, equals(fakeNotes));
    verify(mockNotesLocalDataSourceImpl.loadNotes());
  });
}
