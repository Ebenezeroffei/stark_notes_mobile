import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:starkeep/shared/providers/notes_layout_provider.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesLayout = ref.watch(providerOfNotesLayout);

    final theme = Theme.of(context);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      toolbarHeight: 45,
      floating: true,
      snap: true,
      title: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer.withOpacity(0.6),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu),
                ),
                Text(
                  "Search your notes",
                  style: theme.textTheme.bodyLarge,
                ),
              ],
            ),
            notesLayout == NotesLayout.column
                ? IconButton(
                    onPressed: () => ref
                        .read(providerOfNotesLayout.notifier)
                        .state = NotesLayout.row,
                    icon: const Icon(
                      Icons.view_agenda_outlined,
                    ),
                  )
                : IconButton(
                    onPressed: () => ref
                        .read(providerOfNotesLayout.notifier)
                        .state = NotesLayout.column,
                    icon: const Icon(
                      Icons.grid_view_outlined,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
