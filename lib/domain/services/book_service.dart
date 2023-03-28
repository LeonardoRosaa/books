import 'package:books/core/exceptions/book_exception.dart';
import 'package:books/domain/domain.dart';
import 'package:dartz/dartz.dart';

abstract class BookService {

  const BookService();

  /// Find all stored books.
  /// 
  /// - If the book list is empty returns [EmptyBookException];
  /// - Returns [BookException] if occurs an error to obtain the stored books.
  Future<Either<BookException, List<Book>>> findAll();
}

/// TODO: Add logs
class BookServiceImpl implements BookService {

  const BookServiceImpl({ 
    required this.bookGateway,
  });

  final BookGateway bookGateway;

  @override
  Future<Either<BookException, List<Book>>> findAll() async {
    try {
      final books = await bookGateway.findAll();

      if (books.isEmpty) {
        return left(const EmptyBookException());
      }

      return right(books);
    } catch (error) {
      return left(BookException(error));
    }    
  }
}
