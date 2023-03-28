import 'package:books/domain/domain.dart';

abstract class BookGateway {

  /// Find all books stored
  Future<List<Book>> findAll();
}