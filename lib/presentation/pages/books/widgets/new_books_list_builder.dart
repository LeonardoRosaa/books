import 'package:books/presentation/presentation.dart';
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final last = size - 1;
          final hasDivisor = index != last;
          final isLast = index == last;

          return Padding(
            padding: EdgeInsets.only(
              left: AppSpacing.semiLarge.value,
              right: AppSpacing.semiLarge.value,
              bottom: isLast ? AppSpacing.semiLarge.value : 0,
            ),
            child: Column(
              children: [
                builder(index),
                if (hasDivisor)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSpacing.medium.value,
                    ),
                    child: const BookDivisor(),
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
