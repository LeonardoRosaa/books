import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class BookSearchField extends StatelessWidget {
  const BookSearchField({
    super.key,
    required this.onChanged,
  });

  final OnChanged onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.semiLarge.value,
      ),
      child: Row(
        children: [
          Expanded(
            child: SearchField(
              key: K.searchBookField,
              onChanged: onChanged,
            ),
          ),
          AppIcon.search(
            localizations.search,
            color: theme.colorScheme.outlineVariant,
          )
        ],
      ),
    );
  }
}
