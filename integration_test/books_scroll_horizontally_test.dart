import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common.dart';

void main() {
  patrol('scrolled continue books horizontally', ($) async {
    await $.pumpApp();

    await $(CustomScrollView).waitUntilVisible();

    await $(K.continueBooksList).waitUntilExists();

    expect($(K.continueBooksList), findsOneWidget);

    await $(K.continueBookItem(bookId))
        .scrollTo(scrollable: $(K.continueBooksList).$(Scrollable));
  });
}
