import 'dart:convert';

import 'package:books/data/data.dart';
import 'package:flutter/services.dart';

import 'package:books/domain/domain.dart';

/// Provide the access to the local books stored.
class LocalContinueBookGateway implements BookGateway {

  const LocalContinueBookGateway({
    required this.assetBundle,
  });

  final AssetBundle assetBundle;
  
  @override
  Future<List<Book>> findAll() async {
    final result = await assetBundle.loadString('database/continue_books.json');

    final books =  List<Map<String, dynamic>>.from(jsonDecode(result) as List);

    return books.map(BookModel.fromMap).toList();
  }

}
