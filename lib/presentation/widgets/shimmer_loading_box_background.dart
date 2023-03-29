import 'package:books/core/core.dart';
import 'package:flutter/widgets.dart';

class ShimmerLoadingBoxBackground extends StatelessWidget {
  const ShimmerLoadingBoxBackground({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  ShimmerLoadingBoxBackground.textTitle3({
    super.key,
  })  : height = 14,
        width = 60,
        borderRadius = BorderRadius.circular(10);

  ShimmerLoadingBoxBackground.textParagraph12({
    super.key,
  })  : height = 12,
        width = 60,
        borderRadius = BorderRadius.circular(10);

  final double height;

  final double width;

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: borderRadius,
      ),
    );
  }
}
