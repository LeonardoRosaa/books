import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'common.dart';

void main() {
  patrol('scrolled new books vertically', ($) async {
    await $.pumpApp();

    await $(CustomScrollView).waitUntilVisible();

    await $(K.newBooksList).waitUntilExists();

    expect($(K.newBooksList), findsOneWidget);

    await $.dragUntilExists(
      finder: $(K.newBookItem(bookId)),
      view: $(Scaffold),
      moveStep: const Offset(100, -600),
    );
  });
}
