import 'package:books/core/exceptions/book_exception.dart';
import 'package:books/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common/common.dart';
import '../../mocks/mocks.dart';

void main() {
  group('Book service', () {
    late Faker faker;

    late BookGateway bookGateway;

    late LoggerService loggerService;

    late BookService bookService;

    setUp(() {
      faker = Faker();

      bookGateway = MockBookGateway();
      loggerService = MockLoggerService();
      bookService = BookServiceImpl(
        bookGateway: bookGateway,
        loggerService: loggerService,
      );
    });

    group('find all method', () {
      test('found all books', () async {
        final books = BookCommon.booksGenerate(faker);

        when(() => bookGateway.findAll()).thenAnswer((_) async => books);

        final result = await bookService.findAll();

        expect(result.fold(id, id), books);
      });

      test('empty books', () async {
        final books = <Book>[];

        when(() => bookGateway.findAll()).thenAnswer((_) async => books);

        final result = await bookService.findAll();

        expect(result.fold(id, id), const EmptyBookException());
      });

      test('occured an error to obtain the books stored', () async {
        final exception = Exception();

        when(() => bookGateway.findAll()).thenThrow(exception);
        when(
          () => loggerService.error(
            any<String>(),
            reason: any<dynamic>(named: 'reason'),
          ),
        ).thenAnswer((_) {});

        final result = await bookService.findAll();

        expect(result.fold(id, id), BookException(exception));
      });
    });
  });
}
