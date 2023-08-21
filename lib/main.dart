import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:namoral/app/app_module.dart';
import 'package:namoral/app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  OpenAI.apiKey = dotenv.get('OPEN_AI_API_KEY');
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
