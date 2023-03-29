import 'package:books/core/core.dart';
import 'package:flutter/widgets.dart';

class NewBooksListBuilder extends StatelessWidget {
  const NewBooksListBuilder({
    super.key,
    required this.size,
    required this.builder,
  });

  final int size;

  final Widget Function(int index) builder;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    
    return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final hasDivisor = index != size - 1;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  builder(index),
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
          childCount: size,
        ),
      );
  }
}
