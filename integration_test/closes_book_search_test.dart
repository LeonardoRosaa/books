import 'package:books/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'common.dart';

void main() {
  patrol('closes the search result after clearing the  text field',
      ($) async {
    await $.pumpApp();

    await $(K.newBooksList).waitUntilExists();

    await $(K.searchBookField).enterText(bookSearchText);

    await $.waitUntilVisible($(K.searchBooksList));

    await $(K.searchBookField).enterText('');

    expect($(K.searchBooksList), findsNothing);
  });
}
