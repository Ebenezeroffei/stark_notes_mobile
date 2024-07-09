import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/providers/notes_layout_provider.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notesLayout = ref.watch(providerOfNotesLayout);

    // return Text(
    //   "Data",
    //   style: theme.textTheme.titleMedium,
    // );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Search your notes",
                  textAlign: TextAlign.start,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
          // Notes Layout
          notesLayout == NotesLayout.column
              ? IconButton(
                  onPressed: () => ref
                      .read(providerOfNotesLayout.notifier)
                      .state = NotesLayout.row,
                  icon: const Icon(
                    Icons.grid_view,
                    color: Colors.grey,
                  ),
                )
              : IconButton(
                  onPressed: () => ref
                      .read(providerOfNotesLayout.notifier)
                      .state = NotesLayout.column,
                  icon: const Icon(
                    Icons.view_agenda_outlined,
                    color: Colors.grey,
                  ),
                ),
        ],
      ),
    );
  }
}
