import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookSearchOverlay extends ConsumerStatefulWidget {
  const BookSearchOverlay({super.key});

  @override
  ConsumerState<BookSearchOverlay> createState() => _BookSearchOverlayState();
}

class _BookSearchOverlayState extends ConsumerState<BookSearchOverlay> {

  final _searchAnimationDuration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    final state = ref.watch(searchBooksControllerProvider);
    final isSearching =
        state is EmptySearchBooksState || state is FoundSearchBooksState;

    return Container(
      width: context.dimension.width,
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.tertiary,
            spreadRadius: 10,
            blurRadius: 20,
            offset: const Offset(0, 0.75),
          ),
        ],
      ),
      child: SafeArea(
        child: AnimatedContainer(
          duration: _searchAnimationDuration,
          height: isSearching ? context.dimension.height / 1.6 : 50,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.semiLarge.value,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchField(
                        onChanged: ref
                            .read(searchBooksControllerProvider.notifier)
                            .search,
                      ),
                    ),
                    AppIcon.search(
                      localizations.search,
                      color: theme.colorScheme.outlineVariant,
                    )
                  ],
                ),
              ),
              if (state is FoundSearchBooksState)
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => SearchBookItem(
                      state.found[index],
                    ),
                    separatorBuilder: (context, index) => const BookDivisor(),
                    itemCount: state.found.length,
                  ),
                ),
              if (state is EmptySearchBooksState)
                Expanded(
                  child: Center(
                    child: AppText.paragraph12(
                      localizations.bookEmptySearch,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
