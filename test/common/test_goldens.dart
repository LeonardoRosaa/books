import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

typedef BuilderCallback = Widget Function();

@isTest
void testGoldens(
  String description, {
  BoxConstraints constraints = const BoxConstraints(),
  required String filename,
  required BuilderCallback builder,
}) {
  goldenTest(
    description,
    constraints: constraints,
    fileName: filename,
    builder: builder,
  );
}
