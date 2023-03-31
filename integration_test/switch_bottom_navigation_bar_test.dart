import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

void main() {
  patrol('tapping on items on bottom navigation bar', ($) async {
    await $.pumpApp();

    await $(K.newBooksList).waitUntilExists();

    await $(K.bottomNavigationBarItem(0)).tap();

    expect($(localizations.home), findsOneWidget);

    await $(K.bottomNavigationBarItem(1)).tap();

    expect($(localizations.stack), findsOneWidget);

    await $(K.bottomNavigationBarItem(2)).tap();

    expect($(localizations.compass), findsOneWidget);

    await $(K.bottomNavigationBarItem(3)).tap();

    expect($(localizations.stick), findsOneWidget);
  });
}
