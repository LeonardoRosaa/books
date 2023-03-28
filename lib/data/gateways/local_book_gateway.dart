import 'dart:convert';

import 'package:books/data/data.dart';
import 'package:flutter/services.dart';

import 'package:books/domain/domain.dart';

/// Provide the access to the local books stored.
class LocalBookGateway implements BookGateway {

  const LocalBookGateway({
    required this.assetBundle,
  });

  final AssetBundle assetBundle;
  
  @override
  Future<List<Book>> findAll() async {
    final result = await assetBundle.loadString('database/books.json');

    final books =  List<Map<String, dynamic>>.from(jsonDecode(result) as List);

    return books.map(BookModel.fromMap).toList();
  }

}
