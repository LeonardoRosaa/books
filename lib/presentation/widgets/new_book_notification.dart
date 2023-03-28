import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NewBookNotification extends StatelessWidget {
  const NewBookNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.tertiary,
        ),
      ),
      child: Center(
        child: AppIcon.bell(
          'Bell',
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
