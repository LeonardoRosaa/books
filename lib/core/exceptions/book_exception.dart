import 'package:books/core/exceptions/exceptions.dart';

class BookException extends AppException {
  const BookException([super.error]);
}

class EmptyBookException extends BookException {
  const EmptyBookException([super.error]);
}
