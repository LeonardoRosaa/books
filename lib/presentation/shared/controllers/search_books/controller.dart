import 'package:books/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.dart';

final searchBooksControllerProvider =
    StateNotifierProvider<SearchBooksController, SearchBooksState>(
  (ref) => SearchBooksController.initial(
    searchBookService: ref.read(searchBookServiceProvider),
  ),
);

class SearchBooksController extends StateNotifier<SearchBooksState> {
  SearchBooksController.initial({
    required this.searchBookService,
  }) : super(const InitialSearchBooksState.empty());

  final SearchBookService searchBookService;

  /// Merge the [value] with the current [book] list.
  void setBooks(List<Book> value) {
    final previous = {for (var b in state.books) b.id: b};
    final forward = {for (var b in value) b.id: b};

    previous.addAll(forward);

    final books = previous.entries.map((e) => e.value).toList();

    state = InitialSearchBooksState(books: books);

    searchBookService.resetCache();
  }

  void search(String text) {
    if (text.isEmpty) {
      state = InitialSearchBooksState(books: state.books);
    } else {
      final books = searchBookService.search(text, state.books);

      state = books.fold(
        (_) => EmptySearchBooksState(
          books: state.books,
        ),
        (books) => FoundSearchBooksState(found: books, books: state.books),
      );
    }
  }

  void reset() {
    if (state is! InitialSearchBooksState) {
      state = InitialSearchBooksState(books: state.books);
    }
  }
}
