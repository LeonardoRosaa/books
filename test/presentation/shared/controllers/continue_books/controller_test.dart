import 'package:books/core/exceptions/book_exception.dart';
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
  group('Continue books controller', () {
    late BookService bookService;

    late List<Override> overrides;

    late StateNotifierProvider<ContinueBooksController, BooksState> provider;

    late Faker faker;

    setUp(() {
      faker = Faker();
      bookService = MockBookService();
      overrides = [
        continueBookServiceProvider.overrideWithValue(bookService),
      ];

      provider = continueBooksControllerProvider;
    });

    group('find all method', () {
      late List<Book> books;

      testController<ContinueBooksController, BooksState>(
        'found all continue books',
        overrides: () => overrides,
        setUp: () {
          books = BookCommon.booksGenerate(faker);
          when(() => bookService.findAll()).thenAnswer(
            (_) async => right(books),
          );
        },
        provider: () => provider,
        action: (controller) async => controller.findAll(),
        expected: () => FoundBooksState(books),
      );

      testController<ContinueBooksController, BooksState>(
        'empty continue books',
        overrides: () => overrides,
        setUp: () {
          when(() => bookService.findAll()).thenAnswer(
            (_) async => left(const EmptyBookException()),
          );
        },
        provider: () => provider,
        action: (controller) async => controller.findAll(),
        expected: () => const EmptyBooksState(),
      );

      testController<ContinueBooksController, BooksState>(
        'cannot find the continue books',
        overrides: () => overrides,
        setUp: () {
          when(() => bookService.findAll()).thenAnswer(
            (_) async => left(const BookException()),
          );
        },
        provider: () => provider,
        action: (controller) async => controller.findAll(),
        expected: () => const ErrorBooksState(BookException()),
      );
    });
  });
}
