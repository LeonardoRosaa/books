import 'package:books/domain/domain.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.releasedAt,
    required super.authors,
  });

  factory BookModel.fromMap(Map<String, dynamic> data) {
    return BookModel(
      id: data['id'] as int,
      imageUrl: data['imageUrl'] as String,
      title: data['title'] as String,
      releasedAt: DateTime.fromMillisecondsSinceEpoch(
        data['releasedAt'] as int,
      ),
      authors: List<String>.from(data['authors'] as List),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'releasedAt': releasedAt.millisecondsSinceEpoch,
      'authors': authors,
    };
  }
}
