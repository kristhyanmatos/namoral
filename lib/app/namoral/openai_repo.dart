import 'dart:developer';

import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIRepo {
  final OpenAI openAI;
  OpenAIRepo(this.openAI);

  Future<String> chat(String message) async {
    final prefix = dotenv.get('PRE_FIX');
    final content = '$prefix $message';
    const model = "gpt-3.5-turbo";
    OpenAIChatCompletionModel response = await openAI.chat.create(
      model: model,
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: content,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
    if (response.choices.isNotEmpty) {
      final first = response.choices.first;
      log(first.toMap().toString());
      return first.message.content;
    } else {
      throw Exception('Desculpe, não conseguimos compreender');
    }
  }
}
