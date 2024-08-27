import 'package:dartz/dartz.dart';
import 'package:starkeep/core/labels/data/datasources/local_data_source.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/domain/repositories/labels_repository.dart';
import 'package:starkeep/shared/errors/exceptions.dart';
import 'package:starkeep/shared/errors/failure.dart';

class LabelsRepositoryImpl implements LabelsRepository {
  final LocalDataSourceImpl _localDataSource = LocalDataSourceImpl();

  @override
  Future<Either<Failure, Label>> createLabel(String name) async {
    try {
      Label label = await _localDataSource.createLabel(name);
      return Right(label);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLabel(String id) async {
    try {
      await _localDataSource.deleteLabel(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Label>>> getLabels() async {
    try {
      final List<Label> labels = await _localDataSource.getLabels();
      return Right(labels);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Label>> updateLabel({
    required String id,
    required String name,
  }) async {
    try {
      final Label label =
          await _localDataSource.updateLabel(name: name, id: id);
      return Right(label);
    } on CacheException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
