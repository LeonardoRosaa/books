import 'package:flutter_test/flutter_test.dart';

import 'books_scroll_horizontally_test.dart' as book_scroll_horizontally;
import 'books_scroll_vertically_test.dart' as book_scroll_vertically;
import 'books_search_test.dart' as books_search;
import 'closes_book_search_test.dart' as closes_book_search;
import 'switch_bottom_navigation_bar_test.dart' as switch_bottom_navigation_bar;

void main() {
  group('Bundled all tests', () {
    book_scroll_vertically.main();
    book_scroll_horizontally.main();
    books_search.main();
    closes_book_search.main();
    switch_bottom_navigation_bar.main();
  });
}
