import 'package:dartz/dartz.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/domain/repositories/labels_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class GetLabels {
  final LabelsRepository _repository;

  GetLabels(this._repository);

  Future<Either<Failure, List<Label>>> call() => _repository.getLabels();
}
