import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  group('Search book service', () {
    late Faker faker;

    late LoggerService loggerService;

    late SearchBookService searchBookService;

    setUp(() {
      faker = Faker();
      loggerService = MockLoggerService();
      searchBookService = SearchBookServiceImpl(
        loggerService: loggerService,
      );
    });

    group('search method', () {
      late List<Book> books;

      setUp(() {
        books = [
          Book(
            id: 1,
            imageUrl: faker.internet.httpsUrl(),
            title: 'O Cortiço',
            releasedAt: DateTime(2011, 09, 29),
            authors: const ['Aluísio Azevedo'],
          ),
          Book(
            id: 2,
            imageUrl: faker.internet.httpsUrl(),
            title: 'The Pragmatic Programmer',
            releasedAt: DateTime(2019, 09, 13),
            authors: const ['Andrew Hunt'],
          ),
        ];
      });

      test('searched within diacrets', () {
        final volumes = searchBookService.search('c', books);

        expect(volumes.fold(id, id), books);
      });

      test('cannot find any book', () {
        final volumes = searchBookService.search('y', books);
        
        expect(volumes.fold(id, id), const EmptyBookException());
      });

      test('used the cached books', () {
        searchBookService.search('c', books);
        final volumes = searchBookService.search('c', books);

        expect(volumes.fold(id, id), books);

        verify(() => loggerService.info('Using cached books')).called(1);
      });
    });
  });
}
