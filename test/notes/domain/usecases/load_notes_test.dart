import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/domain/repositories/note_repository.dart';
import 'package:starkeep/core/notes/domain/usecases/load_notes.dart';
import 'package:starkeep/shared/errors/failure.dart';

import 'load_notes_test.mocks.dart';

class FakeNote extends Fake implements Note {}

List<Note> notes = [
  FakeNote(),
  FakeNote(),
  FakeNote(),
  FakeNote(),
  FakeNote(),
  FakeNote(),
];

@GenerateNiceMocks([MockSpec<NotesRepository>()])
void main() {
  late MockNotesRepository mockNotesRepository;
  late LoadNotes usecase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    usecase = LoadNotes(mockNotesRepository);
  });

  test(
    "Should get a list of notes",
    () async {
      // Arrange
      when(mockNotesRepository.loadNotes()).thenAnswer(
        (realInvocation) async => Right(notes),
      );
      // Act
      final result = await usecase.execute();
      // Assert
      expect(result, equals(Right(notes)));
      verify(mockNotesRepository.loadNotes());
    },
  );

  test(
    "Should return a failure when getting  a list oo notes",
    () async {
      // arrange
      when(mockNotesRepository.loadNotes()).thenAnswer(
          (realInvocation) async => Left(Failure("Error getting notes")));
      // act
      final result = await usecase.execute();
      // assert
      expect(
        result,
        equals(Left<Failure, List<Note>>(Failure("Error getting notes"))),
      );
      verify(mockNotesRepository.loadNotes());
    },
  );
}
