import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class PlayBook extends StatelessWidget {
  const PlayBook({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: theme.colorScheme.primary,
      ),
      child: Center(
        child: AppIcon.play(
          'Play',
          color: Colors.white,
        ),
      ),
    );
  }
}
