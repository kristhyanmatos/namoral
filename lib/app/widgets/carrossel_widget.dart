import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CarrosselWidget extends StatefulWidget {
  const CarrosselWidget({super.key});

  @override
  State<CarrosselWidget> createState() => _CarrosselWidgetState();
}

class _CarrosselWidgetState extends State<CarrosselWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  final List<String> _frases = [
    'Namoral',
    'Açaí com açucar ou sem açucar?',
    'Mandar mensagem ou esperar ele(a) responder?',
    'Sempre há Solução',
    'Marvel ou DC?'
  ];
  int indexAtual = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          setState(() {
            indexAtual = (indexAtual + 1) % _frases.length;
          });
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              controller.forward();
            });
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          _frases[indexAtual],
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w300, fontSize: 22),
        )
            .animate(controller: controller)
            .fadeIn(duration: const Duration(seconds: 1))
            .moveY()
            .fadeOut(delay: const Duration(milliseconds: 1500))
            .moveY(),
      ),
    );
  }
}
