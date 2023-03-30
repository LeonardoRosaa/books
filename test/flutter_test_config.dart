import 'dart:async';
import 'package:alchemist/alchemist.dart';
import 'package:books/presentation/presentation.dart';

import 'common/common.dart';
import 'fakers.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  Fakers.registerFallback();
  await prepareLocalization();
  return prepareGoldenTests(testMain);
}

Future<void> prepareGoldenTests(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      ciGoldensConfig: CiGoldensConfig(
        theme: lightTheme,
      ),
      platformGoldensConfig: PlatformGoldensConfig(
        renderShadows: true,
        obscureText: false,
        theme: lightTheme,
      ),
    ),
    run: testMain,
  );
}
