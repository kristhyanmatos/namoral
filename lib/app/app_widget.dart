import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Namoral",
      routeInformationParser: Modular.routeInformationParser,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      routerDelegate: Modular.routerDelegate,
    );
  }
}
