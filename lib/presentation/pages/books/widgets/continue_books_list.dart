import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:books/presentation/widgets/continue_book_item_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContinueBooksList extends ConsumerStatefulWidget {
  const ContinueBooksList({
    super.key,
    required this.width,
  });

  final double width;

  @override
  ConsumerState<ContinueBooksList> createState() => _ContinueBooksListState();
}

class _ContinueBooksListState extends ConsumerState<ContinueBooksList> {
  @override
  void initState() {
    super.initState();
    _findAllBooks();
  }

  Future<void> _findAllBooks() async {
    await Future.delayed(
      Duration.zero,
      () => ref.read(continueBooksControllerProvider.notifier).findAll(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        child: Builder(
          builder: (context) {
            final state = ref.watch(continueBooksControllerProvider);

            if (state is ErrorBooksState) {
              return Center(
                child: AppText.paragraph12(
                  localizations.bookErrorLoadingContinueBooks,
                ),
              );
            } else if (state is EmptyBooksState) {
              return Center(
                child: AppText.paragraph12(
                  localizations.bookEmptyContinueBooks,
                ),
              );
            } else if (state is FoundBooksState) {
              return ContinueBooksListBuilder(
                key: K.continueBooksList,
                size: state.books.length,
                width: widget.width,
                builder: (index) {
                  final book = state.books[index];
                  return ContinueBookItem(
                    book,
                    key: K.continueBookItem(book.id),
                  );
                },
              );
            } else {
              return ContinueBooksListBuilder(
                size: 3,
                width: widget.width,
                builder: (_) => const ContinueBookItemLoading(),
              );
            }
          },
        ),
      ),
    );
  }
}
