import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class NewBookNotification extends StatelessWidget {
  const NewBookNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final borderRadius = BorderRadius.circular(AppSpacing.medium.value);

    return AppInkWell(
      borderRadius: borderRadius,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(
            color: theme.colorScheme.tertiary,
          ),
        ),
        child: Center(
          child: AppIcon.bell(
            localizations.bell,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
