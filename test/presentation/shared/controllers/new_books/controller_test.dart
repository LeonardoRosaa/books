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
  group('New books controller', () {
    late BookService bookService;

    late List<Override> overrides;

    late StateNotifierProvider<NewBooksController, BooksState> provider;

    late Faker faker;

    setUp(() {
      faker = Faker();
      bookService = MockBookService();
      overrides = [
        bookServiceProvider.overrideWithValue(bookService),
      ];

      provider = newBooksControllerProvider;
    });

    group('find all method', () {
      late List<Book> books;

      testController<NewBooksController, BooksState>(
        'found all new books',
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

      testController<NewBooksController, BooksState>(
        'empty new books',
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

      testController<NewBooksController, BooksState>(
        'cannot find the new books',
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
