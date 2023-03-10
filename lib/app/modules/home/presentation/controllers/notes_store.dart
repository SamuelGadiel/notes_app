import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../domain/entities/note.dart';

class NotesStore {
  final ValueNotifier<List<Note>> _notes = RxNotifier<List<Note>>([]);

  List<Note> get notes => _notes.value;
  set notes(List<Note> note) => _notes.value = [..._notes.value, ...note];
}
