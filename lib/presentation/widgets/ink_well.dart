import 'package:books/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    super.key,
    this.onTap,
    this.borderRadius,
    this.overlayColor,
    required this.child,
  });

  final VoidCallback? onTap;

  final BorderRadius? borderRadius;

  final Color? overlayColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final overlayColor = this.overlayColor ?? theme.colorScheme.tertiary;

    void onTap() {
      HapticFeedback.lightImpact();

      if (kDebugMode) {
        print("Tapped");
      }
    }

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(overlayColor),
      child: child,
    );
  }
}
