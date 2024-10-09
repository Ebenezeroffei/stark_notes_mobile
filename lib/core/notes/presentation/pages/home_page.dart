import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/core/notes/presentation/utils/notes_utils.dart';
import 'package:starkeep/core/notes/presentation/widgets/home_page/home_app_bar.dart';
import 'package:starkeep/core/notes/presentation/widgets/home_page/notes.dart';
import 'package:starkeep/shared/widgets/drawer/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: theme.colorScheme.surface,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliverToBoxAdapter(
            child: Notes(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => NotesUtils.createNote(context),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
