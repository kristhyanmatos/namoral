import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../widgets/carrossel_widget.dart';
import '../widgets/gradient_widget.dart';
import '../widgets/rodape_widget.dart';
import 'namoral_store.dart';

class NamoralPage extends StatefulWidget {
  const NamoralPage({super.key});

  @override
  State<NamoralPage> createState() => _NamoralPageState();
}

class _NamoralPageState extends State<NamoralPage> {
  final NamoralStore store = Modular.get<NamoralStore>();
  SpeechToText speechToText = SpeechToText();
  bool gravando = false;
  String duvida = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    await speechToText.initialize(debugLogging: true);
    setState(() {});
  }

  void _startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    gravando = true;
    setState(() {});
  }

  void _stopListening() async {
    await speechToText.stop();
    gravando = false;
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      duvida = result.recognizedWords;
    });
    if (result.finalResult) {
      store.falaAi(duvida);
      gravando = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientWidget(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 2),
              const CarrosselWidget(),
              if (duvida.isNotEmpty)
                Column(
                  children: [
                    Text(duvida,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 16),
                    TripleBuilder(
                      store: store,
                      builder: (context, triple) => Text(
                        triple.state.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 26),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              if (duvida.isNotEmpty) const SizedBox(height: 2),
              const RodaPeWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor:
            gravando ? Theme.of(context).colorScheme.errorContainer : null,
        onPressed:
            speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Namoral',
        child: gravando ? const Text('Parar') : const Text('Namoral'),
      )
          .animate(
            onComplete: (controller) => controller.repeat(),
          )
          .shakeX(
            amount: 2,
            delay: const Duration(seconds: 5),
            duration: const Duration(milliseconds: 200),
          ),
    );
  }
}
