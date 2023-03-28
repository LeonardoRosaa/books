import 'package:books/core/core.dart';
import 'package:books/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  AppIcon.bell(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.bell;

  AppIcon.calendar(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.calendar;

  AppIcon.play(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.play;

  AppIcon.search(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.search;

  final String path;

  final String label;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.theme.colorScheme.outline;

    return SvgPicture.asset(
      path,
      semanticsLabel: label,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
