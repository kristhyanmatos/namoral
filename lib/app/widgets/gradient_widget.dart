import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final Widget child;
  const GradientWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Theme.of(context).colorScheme.background,
          Theme.of(context).colorScheme.surface,
        ],
      )),
      child: child,
    );
  }
}
