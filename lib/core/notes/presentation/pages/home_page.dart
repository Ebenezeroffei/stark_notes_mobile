import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/presentation/widgets/home_app_bar.dart';
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
      body: const CustomScrollView(
        slivers: [
          HomeAppBar(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/note'),
        child: Icon(Icons.add),
        elevation: 0,
      ),
    );
  }
}
