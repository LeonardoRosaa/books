import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AppSpace extends StatelessWidget {
  const AppSpace(
    this.space, {
    super.key,
  });

  final double space;

  @override
  Widget build(BuildContext context) {
    return Gap(space);
  }
}
