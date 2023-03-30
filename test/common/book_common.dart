import 'package:books/data/data.dart';
import 'package:faker/faker.dart';

class BookCommon {
  static BookModel create(Faker faker) {
    final List<String> authors = [];

    for (int i = 0; i < faker.randomGenerator.integer(5, min: 1); i++) {
      authors.add(
        '${faker.person.firstName()} ${faker.person.lastName()}',
      );
    }

    return BookModel(
      id: faker.randomGenerator.integer(1000),
      imageUrl: faker.internet.httpsUrl(),
      title: faker.randomGenerator.string(20),
      releasedAt: DateTime(
        faker.date.dateTime().year,
      ),
      authors: authors,
    );
  }

  static List<BookModel> booksGenerate(Faker faker) {
    final size = faker.randomGenerator.integer(20, min: 2);
    final List<BookModel> books = [];

    for (int i = 0; i < size; i++) {
      books.add(create(faker));
    }

    return books;
  }
}
