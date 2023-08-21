import 'package:flutter/material.dart';

class RodaPeWidget extends StatelessWidget {
  const RodaPeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Clique Namoral',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Diga a dúvida',
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
