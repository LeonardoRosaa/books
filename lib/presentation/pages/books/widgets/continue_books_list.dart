import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class ContinueBooksList extends StatelessWidget {
  const ContinueBooksList({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, _) {
            return const AppSpace(10);
          },
          itemCount: 10,
          itemBuilder: (context, index) => ContinueBookItem(
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
    );
  }
}
