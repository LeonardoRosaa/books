import 'package:flutter/widgets.dart' hide Listener;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart' as flutter_test;
import 'package:meta/meta.dart';
import 'package:mocktail/mocktail.dart';

class Listener<S> extends Mock {
  void call(S? previous, S value);
}

/// Creates a new test case with a description
///
/// - [setUp] register a function to run before the tests.
/// - [overrides] this to override a behavior of a provider.
/// - [provider] this to provide a state.
/// - [action] the action to test.
/// - [verify] check if a method is called.
/// - [expected] the final state expected.
@isTest
void testController<C extends StateNotifier<S>, S>(
  String description, {
  VoidCallback? setUp,
  List<Override> Function()? overrides,
  required StateNotifierProvider<C, S> Function() provider,
  required void Function(C controller) action,
  VoidCallback? verify,
  S Function()? expected,
}) {
  late ProviderContainer container;

  late Listener<S> listener;

  flutter_test.test(description, () async {
    final controller = provider();

    container = ProviderContainer(
      overrides: overrides?.call() ?? [],
    );
    listener = Listener<S>();

    container.listen<S>(
      controller,
      listener,
      fireImmediately: true,
    );

    setUp?.call();

    final work = action;
    final notifier = container.read(controller.notifier);

    if (work is Future<void> Function(C controller)) {
      await work(notifier);
    } else {
      work(notifier);
    }

    // ignore: invalid_use_of_protected_member
    final state = container.read(controller.notifier).state;

    final expect = expected?.call();

    if (expect != null) {
      flutter_test.expect(state, expect);
    }

    verify?.call();

    container.dispose();
  });
}