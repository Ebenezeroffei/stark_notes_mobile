import 'package:dartz/dartz.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/domain/repositories/labels_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class CreateLabel {
  final LabelsRepository _repository;

  CreateLabel(this._repository);

  Future<Either<Failure, Label>> call(String name) =>
      _repository.createLabel(name);
}
