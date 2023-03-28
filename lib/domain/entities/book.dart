import 'package:equatable/equatable.dart';

class Book extends Equatable {

  const Book({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.releasedAt,
    required this.authors,
    this.startedAt,
  });

  final int id;

  /// The image URL for the book cover
  final String imageUrl;

  /// The book title
  final String title;

  /// The release book date
  final DateTime releasedAt;

  /// The authors that have written the book
  final List<String> authors;

  /// The date that the user started to read the book 
  final DateTime? startedAt;

  @override
  List<Object?> get props => [id, imageUrl, title, releasedAt, authors, startedAt];
}