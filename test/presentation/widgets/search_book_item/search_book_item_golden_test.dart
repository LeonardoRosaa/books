import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:books/domain/domain.dart';

import '../../../common/common.dart';

void main() {
  group('Search book item golden', () {
    setUp(() {
      PathProviderCommon.setUp();
    });

    testGoldens(
      'displayed the search book item',
      filename: 'search_item_book',
      constraints: const BoxConstraints(
        maxHeight: 120,
        maxWidth: 365,
      ),
      builder: () => ColoredBox(
        color: Colors.white,
        child: SearchBookItem(
          Book(
            id: 1,
            imageUrl:
                'https://fastly.picsum.photos/id/306/200/200.jpg?hmac=_MA2OQbvCf09ghW0BrkSYh9mOhP-xpHqg2c5joDIRFg',
            title: 'The Lightning Thief',
            releasedAt: DateTime(2005, 06, 28),
            authors: const ['Rick Riordann'],
          ),
        ),
      ),
    );
  });
}
