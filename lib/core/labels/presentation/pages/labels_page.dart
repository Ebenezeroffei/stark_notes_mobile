import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/create_label.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/label.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/labels_list.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/labels_page_app_bar.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/no_labels.dart';

class LabelsPage extends StatelessWidget {
  const LabelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Box<Label> box = Hive.box<Label>('labelsBox');

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (_, box, __) {
          final List<Label> labels = box.values.toList();
          return CustomScrollView(
            slivers: [
              const LabelsPageAppBar(),
              const CreateLabel(),
              labels.isNotEmpty
                  ? SliverList.builder(
                      itemBuilder: (_, int index) => LabelWidget(
                        label: labels[index],
                      ),
                      itemCount: box.values.length,
                    )
                  : NoLabels(),
            ],
          );
        },
      ),
    );
  }
}
