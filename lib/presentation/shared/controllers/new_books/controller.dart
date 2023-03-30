import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newBooksControllerProvider =
    StateNotifierProvider<NewBooksController, BooksState>(
  (ref) => NewBooksController.initial(
    bookService: ref.read(bookServiceProvider),
    searchBooksController: ref.read(searchBooksControllerProvider.notifier),
  ),
);

class NewBooksController extends BooksController {
  NewBooksController.initial({
    required super.searchBooksController,
    required super.bookService,
  }) : super.initial();
}
