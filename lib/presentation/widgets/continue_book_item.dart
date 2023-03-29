import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:books/presentation/widgets/play_book.dart';
import 'package:flutter/material.dart';

class ContinueBookItem extends StatelessWidget {
  const ContinueBookItem(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: AppNetworkImage(
                book.imageUrl,
                width: 100,
                height: 100,
              ),
            ),
            const Positioned(
              bottom: 0,
              right: -5,
              child: PlayBook(),
            ),
          ],
        ),
        const AppSpace.semiMedium(),
        AppText.title3(
          book.title,
          color: theme.colorScheme.outline,
        ),
        AppText.paragraph12(
          book.writers,
          color: theme.colorScheme.secondary.withOpacity(0.5),
        ),
      ],
    );
  }
}
