import 'package:books/core/core.dart';
import 'package:books/domain/domain.dart';
import 'package:intl/intl.dart';

extension BookExtension on Book {

  String get released {
    final format = DateFormat('dd MMMM yyyy');

    return format.format(releasedAt);
  }

  String get writers {
    if (authors.length > 1) {
      return localizations.bookAuthors;
    }

    return authors.first;
  }
}