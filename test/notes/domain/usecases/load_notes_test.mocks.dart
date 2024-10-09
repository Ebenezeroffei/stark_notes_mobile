// Mocks generated by Mockito 5.4.4 from annotations
// in starkeep/test/notes/domain/usecases/load_notes_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:starkeep/core/notes/domain/entities/note.dart' as _i6;
import 'package:starkeep/core/notes/domain/repositories/note_repository.dart'
    as _i3;
import 'package:starkeep/shared/errors/failure.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NotesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNotesRepository extends _i1.Mock implements _i3.NotesRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Note>>> loadNotes() =>
      (super.noSuchMethod(
        Invocation.method(
          #loadNotes,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Note>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Note>>(
          this,
          Invocation.method(
            #loadNotes,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Note>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Note>>(
          this,
          Invocation.method(
            #loadNotes,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Note>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Note>> createNote({
    String? title = r'',
    String? content = r'',
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createNote,
          [],
          {
            #title: title,
            #content: content,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Note>>.value(
            _FakeEither_0<_i5.Failure, _i6.Note>(
          this,
          Invocation.method(
            #createNote,
            [],
            {
              #title: title,
              #content: content,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Note>>.value(
                _FakeEither_0<_i5.Failure, _i6.Note>(
          this,
          Invocation.method(
            #createNote,
            [],
            {
              #title: title,
              #content: content,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Note>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Note>> updateNote({
    required String? id,
    required String? title,
    required String? content,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateNote,
          [],
          {
            #id: id,
            #title: title,
            #content: content,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Note>>.value(
            _FakeEither_0<_i5.Failure, _i6.Note>(
          this,
          Invocation.method(
            #updateNote,
            [],
            {
              #id: id,
              #title: title,
              #content: content,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Note>>.value(
                _FakeEither_0<_i5.Failure, _i6.Note>(
          this,
          Invocation.method(
            #updateNote,
            [],
            {
              #id: id,
              #title: title,
              #content: content,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Note>>);
}
