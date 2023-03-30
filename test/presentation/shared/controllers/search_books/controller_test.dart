import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common/common.dart';
import '../../../../mocks/mocks.dart';

void main() {
  group('Search books controller', () {
    late Faker faker;

    late SearchBookService searchBookService;

    late List<Override> overrides;

    late StateNotifierProvider<SearchBooksController, SearchBooksState>
        provider;

    setUp(() {
      faker = Faker();
      searchBookService = MockSearchBookService();
      provider = searchBooksControllerProvider;

      overrides = [
        searchBookServiceProvider.overrideWithValue(searchBookService),
      ];
    });

    group('set books method', () {
      late List<Book> books;

      setUp(() {
        books = BookCommon.booksGenerate(faker);

        when(() => searchBookService.resetCache()).thenAnswer((_) {});
      });

      testController<SearchBooksController, SearchBooksState>(
        'set up books without books to merge',
        overrides: () => overrides,
        provider: () => provider,
        action: (controller) {
          controller.setBooks(books);
        },
        expected: () => InitialSearchBooksState(books: books),
        verify: () {
          verify(() => searchBookService.resetCache()).called(1);
        },
      );

      testController<SearchBooksController, SearchBooksState>(
        'set up books merging the same books',
        overrides: () => overrides,
        provider: () => provider,
        action: (controller) {
          controller.setBooks(books);
          controller.setBooks(books);
        },
        expected: () => InitialSearchBooksState(books: books),
        verify: () {
          verify(() => searchBookService.resetCache()).called(2);
        },
      );
    });

    group('search method', () {
      late List<Book> books;

      setUp(() {
        books = BookCommon.booksGenerate(faker);

        when(() => searchBookService.resetCache()).thenAnswer((_) {});
      });

      testController<SearchBooksController, SearchBooksState>(
        'found some books',
        overrides: () => overrides,
        setUp: () {
          when(() => searchBookService.search(any<String>(), any<List<Book>>()))
              .thenAnswer((_) => right(books));
        },
        provider: () => provider,
        action: (controller) {
          controller.setBooks(books);
          return controller.search(faker.randomGenerator.string(4));
        },
        expected: () => FoundSearchBooksState(found: books, books: books),
      );

      testController<SearchBooksController, SearchBooksState>(
        'cannot find any books',
        overrides: () => overrides,
        setUp: () {
          when(() => searchBookService.search(any<String>(), any<List<Book>>()))
              .thenAnswer((_) => left(const EmptyBookException()));
        },
        provider: () => provider,
        action: (controller) {
          controller.setBooks(books);
          return controller.search(faker.randomGenerator.string(4));
        },
        expected: () => EmptySearchBooksState(books: books),
      );

      testController<SearchBooksController, SearchBooksState>(
        'go back initial state when the [text] is empty',
        overrides: () => overrides,
        provider: () => provider,
        action: (controller) {
          return controller.search('');
        },
        expected: () => const InitialSearchBooksState(books: []),
        verify: () {
          verifyNever(
            () => searchBookService.search(
              any<String>(),
              any<List<Book>>(),
            ),
          );
        },
      );
    });
  });
}
