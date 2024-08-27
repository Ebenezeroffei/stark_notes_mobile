import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/label.dart';

class LabelsList extends StatelessWidget {
  const LabelsList({super.key});

  @override
  Widget build(BuildContext context) {
    final Box<Label> box = Hive.box<Label>('labelsBox');

    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (_, box, __) {
        final List<Label> labels = box.values.toList();
        return SliverList.builder(
          itemBuilder: (_, int index) => LabelWidget(
            label: labels[index],
          ),
          itemCount: box.values.length,
        );
      },
    );
  }
}
