import 'package:books/core/core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.url, {
    super.key,
    this.width,
    this.height,
  });

  final String url;

  final double? width;

  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorWidget: (_, __, dynamic ___) => SizedBox(
        width: width,
        height: height,
        child: ColoredBox(color: theme.colorScheme.primary),
      ),
    );
  }
}
