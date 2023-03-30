import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:dartz/dartz.dart';
import 'package:diacritic/diacritic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchBookServiceProvider = Provider<SearchBookService>(
  (ref) => SearchBookServiceImpl(
    loggerService: LocalLoggerService.withTag('Search Book Service'),
  ),
);

abstract class SearchBookService {
  /// Search the [text] inside [books].
  ///
  /// - Returns [EmptyBookException] if the cannot find any books.
  Either<EmptyBookException, List<Book>> search(String text, List<Book> books);

  /// Clear the cached books.
  void resetCache();
}

class SearchBookServiceImpl implements SearchBookService {
  SearchBookServiceImpl({
    required this.loggerService,
  });

  final LoggerService loggerService;

  /// The books cache searching
  late Map<String, List<Book>> _books = {};

  @override
  Either<EmptyBookException, List<Book>> search(String text, List<Book> books) {
    /// The search result.
    late final List<Book> volumes;

    final word = removeDiacritics(text).toLowerCase();
    final cachedBooks = _books[word];

    if (cachedBooks == null) {
      loggerService.info('Searching in books');
      volumes = _searchInBooks(word, books);
    } else {
      loggerService.info('Using cached books');
      volumes = cachedBooks;
    }

    /// Update the books cache using the [word] as the [key].
    _books.update(
      word,
      (book) => book,
      ifAbsent: () => volumes,
    );

    if (volumes.isEmpty) {
      return left(const EmptyBookException());
    }

    return right(volumes);
  }

  List<Book> _searchInBooks(String word, List<Book> books) {
    return books.where((book) {
      final title = removeDiacritics(book.title).toLowerCase();

      if (title.contains(word)) {
        return true;
      }

      final authors = book.authors.where((author) {
        final writer = removeDiacritics(author).toLowerCase();

        return writer.contains(word);
      });

      return authors.isNotEmpty;
    }).toList();
  }

  @override
  void resetCache() {
    _books = {};
  }
}
