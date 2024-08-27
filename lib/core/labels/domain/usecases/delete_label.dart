import 'package:dartz/dartz.dart';
import 'package:starkeep/core/labels/domain/repositories/labels_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class DeleteLabel {
  final LabelsRepository _repository;

  DeleteLabel(this._repository);

  Future<Either<Failure, void>> call(String id) => _repository.deleteLabel(id);
}
