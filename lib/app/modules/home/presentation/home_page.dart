import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'controllers/notes_controller.dart';
import 'controllers/notes_store.dart';
import 'widgets/note_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final notesStore = Modular.get<NotesStore>();
  final notesController = Modular.get<NotesController>();

  void createNote(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.teal.shade200,
      isDismissible: true,
      useSafeArea: true,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          builder: (context) => TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Escreva sua nota...',
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => notesStore.notes);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNote(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              itemCount: notesStore.notes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final note = notesStore.notes.elementAt(index);

                return NoteCard(note: note);
              },
            ),
          ],
        ),
      ),
    );
  }
}
