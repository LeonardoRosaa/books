import 'package:books/core/exceptions/book_exception.dart';
import 'package:books/domain/domain.dart';
import 'package:dartz/dartz.dart';

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

class BookServiceImpl extends BookService {

  const BookServiceImpl({ 
    required super.bookGateway,
    required super.loggerService,
  });
}
