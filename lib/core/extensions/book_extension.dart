import 'package:books/domain/domain.dart';
import 'package:intl/intl.dart';

extension BookExtension on Book {

  String get released {
    final format = DateFormat('dd MMMM yyyy');

    return format.format(releasedAt);
  }
}