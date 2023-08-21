import 'package:flutter_triple/flutter_triple.dart';

import 'openai_repo.dart';

class NamoralStore extends Store<String> {
  final OpenAIRepo repo;
  NamoralStore(this.repo) : super('');

  Future<void> falaAi(String message) async {
    repo.chat(message).then((value) => update(value));
  }
}
