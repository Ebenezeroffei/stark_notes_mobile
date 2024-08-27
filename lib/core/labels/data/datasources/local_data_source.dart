import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/shared/errors/exceptions.dart';

abstract class LocalDataSource {
  Future<Label> createLabel(String name);

  Future<List<Label>> getLabels();

  Future<Label> updateLabel({required String name, required String id});

  Future<void> deleteLabel(String id);
}

class LocalDataSourceImpl implements LocalDataSource {
  Future<Box<Label>> openLabelBox() async {
    // await Hive.openBox<Label>('labelsBox');
    return Hive.box<Label>('labelsBox');
  }

  @override
  Future<Label> createLabel(String name) async {
    try {
      final Box<Label> labels = await openLabelBox();
      final List<String> uniqueLabels = [];
      labels.values.forEach(
          (label) => uniqueLabels.add(label.name.trim().toLowerCase()));
      if (uniqueLabels.contains(name.trim().toLowerCase())) {
        throw CacheException("This label already exists");
      }
      final Label label = Label(name: name.trim());
      labels.put(label.id, label);
      return label;
    } on CacheException catch (e) {
      throw CacheException(e.message);
    } catch (e) {
      throw CacheException("There was a problem when creating the label.");
    }
  }

  @override
  Future<void> deleteLabel(String id) async {
    try {
      final Box labels = await openLabelBox();
      labels.delete(id);
    } catch (e) {
      throw CacheException("There was a problem deleting the label.");
    }
  }

  @override
  Future<List<Label>> getLabels() async {
    try {
      final Box<Label> labels = await openLabelBox();
      return labels.values.toList();
    } catch (e) {
      throw CacheException("There was a problem retrieving the labels.");
    }
  }

  @override
  Future<Label> updateLabel({required String name, required String id}) async {
    try {
      final Box<Label> labels = await openLabelBox();
      final List<String> uniqueLabels = [];
      labels.values.forEach((label) {
        if (label.id != id) uniqueLabels.add(label.name.trim().toLowerCase());
      });

      if (uniqueLabels.contains(name.trim().toLowerCase())) {
        throw CacheException("This label already exists.");
      }
      final Label updatedLabel = Label.copy(
        name: name.trim(),
        id: id,
      );
      labels.put(id, updatedLabel);
      return updatedLabel;
    } on CacheException catch (e) {
      throw CacheException(e.message);
    } catch (e) {
      throw CacheException("There was a problem updating the label.");
    }
  }
}
