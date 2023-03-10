import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/notes_controller.dart';
import 'presentation/controllers/notes_store.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => NotesStore()),
    Bind((i) => NotesController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => HomePage()),
  ];
}
