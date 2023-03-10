import '../../domain/entities/note.dart';
import 'notes_store.dart';

class NotesController {
  final NotesStore notesStore;

  NotesController(this.notesStore);

  void addNote(Note note) {
    notesStore.notes = [note];
  }

  void create() {
    final note = Note(
      title: 'Teste',
      resume:
          'Id Lorem dolore aliquip eiusmod cupidatat voluptate nisi dolore esse labore adipisicing esse do irure. Consectetur in fugiat nisi non anim aliquip occaecat non consectetur enim aliquip officia consequat.',
      createdAt: DateTime.now(),
      tags: [],
      color: '00000000',
      group: '',
    );

    addNote(note);
  }
}
