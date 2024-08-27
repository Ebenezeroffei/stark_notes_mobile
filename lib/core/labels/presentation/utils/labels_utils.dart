import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starkeep/core/labels/data/repositories/labels_repository_impl.dart';
import 'package:starkeep/core/labels/domain/usecases/create_label.dart';
import 'package:starkeep/core/labels/domain/usecases/delete_label.dart';
import 'package:starkeep/core/labels/domain/usecases/update_label.dart';
import 'package:starkeep/shared/toasts/toast.dart';

class LabelsUtils {
  static createLabel({
    required TextEditingController controller,
  }) async {
    final labelName = controller.text;
    if (labelName.isNotEmpty) {
      final LabelsRepositoryImpl labelsRepository = LabelsRepositoryImpl();
      final CreateLabel usecase = CreateLabel(labelsRepository);
      final res = await usecase.call(labelName);

      res.fold(
        (l) => Toast.error(l.message),
        (r) {
          controller.clear();
          Toast.success("Label added");
        },
      );
    }
  }

  static updateLabel({
    required String id,
    required String newName,
    required VoidCallback onComplete,
  }) async {
    if (id.isNotEmpty && newName.isNotEmpty) {
      final LabelsRepositoryImpl repository = LabelsRepositoryImpl();
      final UpdateLabel usecase = UpdateLabel(repository);
      final res = await usecase.call(name: newName, id: id);

      res.fold((l) => Toast.error(l.message), (r) {
        Toast.success("Label updated successfully");
        onComplete();
      });
    }
  }

  static deleteLabel(String id) async {
    if (id.isNotEmpty) {
      final LabelsRepositoryImpl repository = LabelsRepositoryImpl();
      final DeleteLabel usecase = DeleteLabel(repository);

      final res = await usecase.call(id);

      res.fold(
        (l) => Toast.error(l.message),
        (r) => Toast.success("Label deleted successfully"),
      );
    }
  }
}
