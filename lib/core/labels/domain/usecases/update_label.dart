import 'package:dartz/dartz.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/domain/repositories/labels_repository.dart';
import 'package:starkeep/shared/errors/failure.dart';

class UpdateLabel {
  final LabelsRepository _repository;

  UpdateLabel(this._repository);

  Future<Either<Failure, Label>> call(
          {required String name, required String id}) =>
      _repository.updateLabel(id: id, name: name);
}
