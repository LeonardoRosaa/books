import 'dart:convert';

import 'package:books/data/data.dart';
import 'package:books/domain/domain.dart';
import 'package:faker/faker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/common.dart';
import '../../mocks/mocks.dart';

void main() {
  group('Local continue book gateway', () {

    late Faker faker;

    late AssetBundle assetBundle;

    late BookGateway bookGateway;

    setUp(() {
      faker = Faker();

      assetBundle = MockAssetBundle();
      bookGateway = LocalBookGateway(assetBundle: assetBundle);
    });

    group('find all method', () {

      test('found all books started', () async {
        final books = BookCommon.booksGenerate(faker);

        when(() => assetBundle.loadString(any<String>())).thenAnswer(
          (_) async => jsonEncode(books.map((e) => e.toMap()).toList()),
        );

        final result = await bookGateway.findAll();

        expect(result, books);
      });
    });
  });
}
