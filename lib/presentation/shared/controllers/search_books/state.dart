part of 'controller.dart';

abstract class SearchBooksState extends Equatable {
  const SearchBooksState({
    required this.books,
  });

  final List<Book> books;

  @override
  List<Object?> get props => [books];
}

class InitialSearchBooksState extends SearchBooksState {
  const InitialSearchBooksState({
    required super.books,
  });

  const InitialSearchBooksState.empty()
      : super(
          books: const [],
        );
}

class EmptySearchBooksState extends SearchBooksState {
  const EmptySearchBooksState({
    required super.books,
  });
}

class FoundSearchBooksState extends SearchBooksState {
  const FoundSearchBooksState({
    required this.found,
    required super.books,
  });

  final List<Book> found;

  @override
  List<Object?> get props => [books, found];
}
