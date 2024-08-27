import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/shared/widgets/drawer/custom_drawer_menu_item.dart';

class CustomDrawerLabels extends StatelessWidget {
  const CustomDrawerLabels({super.key});

  @override
  Widget build(BuildContext context) {
    final Box labelsBox = Hive.box<Label>('labelsBox');

    return ValueListenableBuilder(
      valueListenable: labelsBox.listenable(),
      builder: (_, box, __) => Column(
        children: box.values
            .toList()
            .map(
              (label) => CustomDrawerMenuItem(
                icon: Icons.label_outline,
                title: label.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
