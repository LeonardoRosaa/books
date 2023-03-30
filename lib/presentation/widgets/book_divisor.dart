import 'package:books/core/core.dart';
import 'package:flutter/widgets.dart';

class BookDivisor extends StatelessWidget {
  const BookDivisor({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      height: 1,
      color: theme.colorScheme.tertiary,
    );
  }
}
