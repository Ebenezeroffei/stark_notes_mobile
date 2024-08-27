import 'package:dartz/dartz.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/shared/errors/failure.dart';

abstract class LabelsRepository {
  Future<Either<Failure, Label>> createLabel(String name);

  Future<Either<Failure, List<Label>>> getLabels();

  Future<Either<Failure, Label>> updateLabel({
    required String id,
    required String name,
  });

  Future<Either<Failure, void>> deleteLabel(String id);
}
