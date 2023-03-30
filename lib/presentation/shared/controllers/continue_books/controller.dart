import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final continueBooksControllerProvider =
    StateNotifierProvider<ContinueBooksController, BooksState>(
  (ref) => ContinueBooksController.initial(
    bookService: ref.read(continueBookServiceProvider),
    searchBooksController: ref.read(searchBooksControllerProvider.notifier),
  ),
);

class ContinueBooksController extends BooksController {
  ContinueBooksController.initial({
    required super.searchBooksController,
    required super.bookService,
  }) : super.initial();
}
