import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class SearchBookItem extends StatelessWidget {
  const SearchBookItem(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AppInkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.semiLarge.value,
          vertical: AppSpacing.semiMedium.value,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AppNetworkImage(
                book.imageUrl,
                width: 54,
                height: 92,
              ),
            ),
            const AppSpace.semiLarge(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ],
        ),
      ),
    );
  }
}
