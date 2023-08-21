import 'package:flutter_modular/flutter_modular.dart';

import 'namoral/namoral_module.dart';

class AppModule extends Module {
  @override
  void routes(r) => {
        r.module('/', module: NamoralModule()),
      };
}
