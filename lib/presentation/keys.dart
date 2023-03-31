import 'package:flutter/foundation.dart';

typedef K = Keys;

class Keys {
  const Keys();

  static const continueBooksList = Key('continueBooksList');
  static const newBooksList = Key('newBooksList');
  static const searchBooksList = Key('searchBooksList');
  static const searchBookField = Key('searchBookField');
  static Key newBookItem(int id) => Key('newBookItem$id');
  static Key continueBookItem(int id) => Key('continueBookItem$id');
  static Key searchBookItem(int id) => Key('searchBookItem$id');
  static Key bottomNavigationBarItem(int id) => Key('bottomNavigationBarItem$id');
}