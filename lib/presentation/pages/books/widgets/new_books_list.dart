import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class NewBooksList extends StatelessWidget {
  const NewBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final hasDivisor = index != 9;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                NewBookItem(
                  Book(
                    id: 1,
                    imageUrl:
                        'https://fastly.picsum.photos/id/306/200/200.jpg?hmac=_MA2OQbvCf09ghW0BrkSYh9mOhP-xpHqg2c5joDIRFg',
                    title: 'The Lightning Thief',
                    releasedAt: DateTime(2005, 06, 28),
                    authors: const ['Rick Riordann'],
                  ),
                ),
                if (hasDivisor)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Container(
                      height: 1,
                      color: theme.colorScheme.tertiary,
                    ),
                  )
              ],
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
