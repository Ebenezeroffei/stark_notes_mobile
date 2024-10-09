import 'package:flutter/material.dart';
import 'package:starkeep/core/notes/domain/entities/note.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  const NoteItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        '/note',
        arguments: note.id,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.8),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              note.content,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ).padB(10),
    );
  }
}
