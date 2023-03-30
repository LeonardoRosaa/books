import 'package:books/core/exceptions/book_exception.dart';
import 'package:books/data/data.dart';
import 'package:books/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef FindAll = Future<Either<BookException, List<Book>>>;

abstract class BookService {
  const BookService({
    required this.bookGateway,
    required this.loggerService,
  });

  final BookGateway bookGateway;

  final LoggerService loggerService;

  /// Find all books.
  ///
  /// - If the book list is empty returns [EmptyBookException];
  /// - Returns [BookException] if occurs an error to obtain the stored books.
  FindAll findAll() async {
    try {
      final books = await bookGateway.findAll();

      if (books.isEmpty) {
        return left(const EmptyBookException());
      }

      return right(books);
    } catch (error) {
      loggerService.error('Cannot obtain the books stored', reason: error);
      return left(BookException(error));
    }
  }
}

final bookServiceProvider = Provider<BookService>(
  (ref) => BookServiceImpl(
    bookGateway: ref.read(localBookGatewayProvider),
    loggerService: LocalLoggerService.withTag('Book Service'),
  ),
);

class BookServiceImpl extends BookService {
  const BookServiceImpl({
    required super.bookGateway,
    required super.loggerService,
  });
}
