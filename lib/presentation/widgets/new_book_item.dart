import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewBookItem extends StatelessWidget {
  const NewBookItem(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AppNetworkImage(
            book.imageUrl,
            width: 75,
            height: 100,
          ),
        ),
        const AppSpace(10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.title3(
                    book.title,
                    color: theme.colorScheme.outline,
                  ),
                  AppText.paragraph12(
                    book.writers,
                    color: theme.colorScheme.secondary.withOpacity(0.5),
                  ),
                ],
              ),
              const AppSpace(10),
              Row(
                children: [
                  AppIcon.calendar(localizations.calendar),
                  const AppSpace(10),
                  AppText.paragraph12(
                    book.released,
                    color: theme.colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
        ),
        const AppSpace(10),
        const Center(
          child: NewBookNotification(),
        )
      ],
    );
  }
}
