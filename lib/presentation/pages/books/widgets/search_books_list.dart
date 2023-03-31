import 'package:books/domain/domain.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';

class SearchBooksList extends StatelessWidget {
  const SearchBooksList({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final book = books[index];

        return SearchBookItem(
          book,
          key: K.searchBookItem(book.id),
        );
      },
      separatorBuilder: (context, index) => const BookDivisor(),
      itemCount: books.length,
    );
  }
}
