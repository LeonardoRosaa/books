import 'package:books/core/core.dart';
import 'package:books/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.label, {
    required this.path,
    super.key,
    this.color,
  });

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

  AppIcon.compass(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.compass;

  AppIcon.home(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.home;

  AppIcon.stack(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.stack;

  AppIcon.stick(
    this.label, {
    super.key,
    this.color,
  }) : path = Assets.icons.stick;

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
