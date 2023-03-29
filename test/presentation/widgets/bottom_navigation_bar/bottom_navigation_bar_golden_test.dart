import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common/common.dart';

void main() {
  group('Bottom navigation bar', () {
    testGoldens(
      'displayed items',
      filename: 'bottom_navigation_bar',
      constraints: const BoxConstraints(
        maxWidth: 400,
        maxHeight: 100,
      ),
      builder: () => const AppBottomNavigationBar(),
    );
  });
}
