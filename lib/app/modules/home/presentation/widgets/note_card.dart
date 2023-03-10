import 'package:flutter/material.dart';

import '../../domain/entities/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: Theme.of(context).textTheme.titleMedium),
            Text(note.resume),
          ],
        ),
      ),
    );
  }
}
