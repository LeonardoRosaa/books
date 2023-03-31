import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

import 'common.dart';

void main() {
  patrol('found some books on searching', ($) async {
    await $.pumpApp();

    await $(K.newBooksList).waitUntilExists();

    await $(K.searchBookField).enterText('T');

    await $(K.searchBookItem(bookId))
        .scrollTo(scrollable: $(K.searchBooksList).$(Scrollable));
  });
}
