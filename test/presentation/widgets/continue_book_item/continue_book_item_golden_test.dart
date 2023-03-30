import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:books/domain/domain.dart';

import '../../../common/common.dart';

void main() {
  group('New book item golden', () {
    setUp(() {
      PathProviderCommon.setUp();
    });

    testGoldens(
      'displayed the continue book item',
      filename: 'continue_item_book',
      constraints: const BoxConstraints(
        maxHeight: 250,
        maxWidth: 250,
      ),
      builder: () => Center(
        child: ColoredBox(
          color: Colors.white,
          child: ContinueBookItem(
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
      ),
    );
  });
}

