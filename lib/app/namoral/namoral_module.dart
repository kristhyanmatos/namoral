import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'namoral_page.dart';
import 'namoral_store.dart';
import 'openai_repo.dart';

class NamoralModule extends Module {
  @override
  void binds(i) => {
        i.addInstance(OpenAI.instance),
        i.addSingleton(OpenAIRepo.new),
        i.add(NamoralStore.new),
      };

  @override
  void routes(r) => {
        r.child(Modular.initialRoute, child: (context) => const NamoralPage()),
      };
}
