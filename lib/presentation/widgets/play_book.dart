import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class PlayBook extends StatelessWidget {
  const PlayBook({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final borderRadius = BorderRadius.circular(100);

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: theme.colorScheme.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: AppInkWell(
          overlayColor: theme.colorScheme.outlineVariant,
          borderRadius: borderRadius,
          child: Center(
            child: AppIcon.play(
              localizations.play,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
