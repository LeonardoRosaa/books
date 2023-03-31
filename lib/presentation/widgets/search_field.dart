import 'package:books/core/core.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onChanged,
  });

  final OnChanged onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return TextField(
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.outline,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        filled: true,
        hintText: localizations.bookSearchLabel,
        fillColor: theme.colorScheme.background,
        hintStyle: theme.textTheme.displaySmall?.copyWith(
          color: theme.colorScheme.outlineVariant,
        ),
      ),
    );
  }
}
