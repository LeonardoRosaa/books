part of 'controller.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object?> get props => [];
}

class InitialBooksState extends BooksState {
  const InitialBooksState();
}

class LoadingBooksState extends BooksState {
  const LoadingBooksState();
}

class FoundBooksState extends BooksState {
  const FoundBooksState(this.books);

  final List<Book> books;

  @override
  List<Object?> get props => [books];
}

class EmptyBooksState extends BooksState {
  const EmptyBooksState();
}

class ErrorBooksState extends BooksState {
  const ErrorBooksState(this.error);

  final AppException error;

  @override
  List<Object?> get props => [error];
}
