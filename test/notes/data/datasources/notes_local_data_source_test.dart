import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:starkeep/core/notes/data/datasources/notes_local_data_source.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

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
  late MockNotesLocalDataSourceImpl mockNotesLocalDataSource;
  late NotesLocalDataSourceImpl localDataSource;

  setUp(() {
    mockNotesLocalDataSource = MockNotesLocalDataSourceImpl();
    localDataSource = NotesLocalDataSourceImpl();
  });

  test(
    "Should return a list of notes",
    () async {
      // arrange
      when(mockNotesLocalDataSource.loadNotes())
          .thenAnswer((realInvocation) async => fakeNotes);
      // act
      final result = await localDataSource.loadNotes();
      // assert
      expect(result, equals(fakeNotes));
      // verify(mockNotesLocalDataSource.loadNotes());
    },
  );
}
