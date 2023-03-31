import 'package:books/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:patrol/patrol.dart';

const bookId = int.fromEnvironment('BOOK_ID');
const bookSearchText = String.fromEnvironment('BOOK_SEARCH_TEXT');

extension PatrolTesterExtension on PatrolTester {
  
  Future<void> pumpApp() {
    return pumpWidget(const App());
  }
}

@isTest
void patrol(String description, PatrolTesterCallback callback) {
  return patrolTest(
    description,
    callback,
    nativeAutomation: true,
  );
}
