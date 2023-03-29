import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class AppSpace extends StatelessWidget {
  const AppSpace.semiSmall({
    super.key,
  }) : space = AppSpacing.semiSmall;

  const AppSpace.small({
    super.key,
  }) : space = AppSpacing.small;

  const AppSpace.semiMedium({
    super.key,
  }) : space = AppSpacing.semiMedium;

  const AppSpace.medium({
    super.key,
  }) : space = AppSpacing.medium;

  const AppSpace.semiLarge({
    super.key,
  }) : space = AppSpacing.semiLarge;
  
  final AppSpacing space;

  @override
  Widget build(BuildContext context) {
    return Gap(space.value);
  }
}
