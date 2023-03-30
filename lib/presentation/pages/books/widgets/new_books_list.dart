import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewBooksList extends ConsumerStatefulWidget {
  const NewBooksList({super.key});

  @override
  ConsumerState<NewBooksList> createState() => _NewBooksListState();
}

class _NewBooksListState extends ConsumerState<NewBooksList> {
  @override
  void initState() {
    super.initState();
    _findAllBooks();
  }

  Future<void> _findAllBooks() async {
    await Future.delayed(
      Duration.zero,
      () => ref.read(newBooksControllerProvider.notifier).findAll(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newBooksControllerProvider);

    if (state is ErrorBooksState) {
      return SliverMessage(localizations.bookErrorLoadingNewBooks);
    } else if (state is FoundBooksState) {
      final size = state.books.length;

      return NewBooksListBuilder(
        size: size,
        builder: (index) => NewBookItem(
          state.books[index],
        ),
      );
    } else if (state is EmptyBooksState) {
      return SliverMessage(localizations.bookEmptyNewBooks);
    } else {
      const size = 5;
      return NewBooksListBuilder(
        size: size,
        builder: (_) => const NewBookItemLoading(),
      );
    }
  }
}
