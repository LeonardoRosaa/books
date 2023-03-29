import 'dart:convert';

import 'package:books/data/data.dart';
import 'package:flutter/services.dart';

import 'package:books/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localContinueBookGatewayProvider = Provider<BookGateway>(
  (ref) => LocalContinueBookGateway(
    assetBundle: rootBundle,
  ),
);

/// Provide the access to the local started books stored.
class LocalContinueBookGateway implements BookGateway {
  const LocalContinueBookGateway({
    required this.assetBundle,
  });

  final AssetBundle assetBundle;

  @override
  Future<List<Book>> findAll() async {
    final result = await assetBundle.loadString('database/continue_books.json');

    final books = List<Map<String, dynamic>>.from(jsonDecode(result) as List);

    return books.map(BookModel.fromMap).toList();
  }
}
