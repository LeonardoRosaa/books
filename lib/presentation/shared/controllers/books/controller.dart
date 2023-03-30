import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:books/presentation/shared/controllers/search_books/controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'state.dart';

abstract class BooksController extends StateNotifier<BooksState> {
  BooksController.initial({
    required this.bookService,
    required this.searchBooksController,
  }) : super(
          const InitialBooksState(),
        );

  final SearchBooksController searchBooksController;

  final BookService bookService;

  Future<void> findAll() async {
    state = const LoadingBooksState();

    await Future<dynamic>.delayed(const Duration(seconds: 1));

    final books = await bookService.findAll();

    state = books.fold(
      (error) {
        if (error is EmptyBookException) {
          return const EmptyBooksState();
        }

        return ErrorBooksState(error);
      },
      (books) {
        searchBooksController.setBooks(books);
        return FoundBooksState(books);
      },
    );
  }
}
