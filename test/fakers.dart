import 'package:books/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class FakeBook extends Fake implements Book {}

class Fakers {
  static void registerFallback() {
    registerFallbackValue(FakeBook());
  }
}