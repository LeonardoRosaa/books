import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class ContinueBooksListBuilder extends StatelessWidget {
  const ContinueBooksListBuilder({
    super.key,
    required this.size,
    required this.width,
    required this.builder,
  });

  final int size;

  final double width;

  final Widget Function(int index) builder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, _) {
        return const AppSpace(10);
      },
      itemCount: 4,
      itemBuilder: (context, index) => SizedBox(
        width: width / 3.5,
        child: builder(index),
      ),
    );
  }
}
