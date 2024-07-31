import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starkeep/shared/widgets/drawer/custom_drawer_menu_item.dart';
import 'package:starkeep/shared/widgets/drawer/custom_drawer_theme_select.dart';
import 'package:starkeep/shared/widgets/drawer/custom_drawer_title.dart';
import 'package:starkeep/shared/widgets/drawer/custom_drawer_update_labels.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: const [
            CustomDrawerTitle(),
            SizedBox(
              height: 20,
            ),
            CustomDrawerMenuItem(
              icon: Icons.notes_outlined,
              title: "Notes",
            ),
            Divider(),
            CustomDrawerUpdateLabels(),
            CustomDrawerMenuItem(
              icon: Icons.add,
              title: "Create a label",
            ),
            Divider(),
            CustomDrawerMenuItem(
              icon: Icons.archive_outlined,
              title: "Archive",
            ),
            CustomDrawerMenuItem(
              icon: Icons.delete_outlined,
              title: "Trash",
            ),
            Divider(),
            CustomDrawerThemeSelect(),
          ],
        ),
      ),
    );
  }
}
