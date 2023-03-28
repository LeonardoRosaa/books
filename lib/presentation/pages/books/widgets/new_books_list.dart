import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:books/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';

class NewBooksList extends StatelessWidget {
  const NewBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.tab(
            'New',
            color: theme.colorScheme.primary,
          ),
          const AppSpace(10),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Container(
                    height: 1,
                    color: theme.colorScheme.tertiary,
                  ),
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) => NewBookItem(
                Book(
                  id: 1,
                  imageUrl:
                      'https://fastly.picsum.photos/id/306/200/200.jpg?hmac=_MA2OQbvCf09ghW0BrkSYh9mOhP-xpHqg2c5joDIRFg',
                  title: 'The Lightning Thief',
                  releasedAt: DateTime(2005, 06, 28),
                  authors: const ['Rick Riordann'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
