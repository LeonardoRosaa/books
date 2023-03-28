import 'package:books/domain/domain.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.releasedAt,
    required super.authors,
    super.startedAt,
  });

  factory BookModel.fromMap(Map<String, dynamic> data) {
    final startedAt = data['startedAt'] as int?;

    return BookModel(
      id: data['id'] as int,
      imageUrl: data['imageUrl'] as String,
      title: data['title'] as String,
      releasedAt: DateTime.fromMillisecondsSinceEpoch(
        data['releasedAt'] as int,
      ),
      authors: List<String>.from(data['authors'] as List),
      startedAt: startedAt == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(startedAt),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'releasedAt': releasedAt.millisecondsSinceEpoch,
      'authors': authors,
      'startedAt': startedAt?.millisecondsSinceEpoch,
    };
  }
}
