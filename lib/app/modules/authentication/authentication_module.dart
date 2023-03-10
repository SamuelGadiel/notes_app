import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/authentication_page.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const AuthenticationPage()),
  ];
}
