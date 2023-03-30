import 'package:books/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockLoggerService extends Mock implements LoggerService {}

class MockBookService extends Mock implements BookService {}

class MockSearchBookService extends Mock implements SearchBookService {}