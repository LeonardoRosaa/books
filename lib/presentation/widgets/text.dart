import 'package:books/core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTextLevel {
  title3,
  tab,
  paragraph12,
}

class AppText extends StatelessWidget {
  const AppText.title3(
    this.data, {
    super.key,
    this.color,
  }) : level = AppTextLevel.title3;

  const AppText.tab(
    this.data, {
    super.key,
    this.color,
  }) : level = AppTextLevel.tab;

  const AppText.paragraph12(
    this.data, {
    super.key,
    this.color,
  }) : level = AppTextLevel.paragraph12;

  final String data;

  final Color? color;

  final AppTextLevel level;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final style = () {
      switch (level) {
        case AppTextLevel.title3:
          return theme.textTheme.displaySmall;
        case AppTextLevel.tab:
          return theme.textTheme.labelSmall;
        case AppTextLevel.paragraph12:
          return theme.textTheme.bodyMedium;
      }
    }();

    return Text(
      data,
      style: GoogleFonts.rubik(
        textStyle: style,
        color: theme.colorScheme.outline,
      ),
    );
  }
}
