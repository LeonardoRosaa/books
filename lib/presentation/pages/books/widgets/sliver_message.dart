import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class SliverMessage extends StatelessWidget {
  const SliverMessage(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: AppText.paragraph12(
          message,
        ),
      ),
    );
  }
}
