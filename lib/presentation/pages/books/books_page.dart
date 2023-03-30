import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooksPage extends ConsumerStatefulWidget {
  const BooksPage({super.key});

  @override
  ConsumerState<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends ConsumerState<BooksPage> {
  late final OverlayEntry _searchOverlay;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.endOfFrame.then((_) => _startSearchOverlay());
  }

  void _startSearchOverlay() {
    final overlayState = Overlay.of(context);
    _searchOverlay = OverlayEntry(
      builder: (context) {
        return const Positioned(
          top: 0,
          child: BookSearchOverlay(),
        );
      },
    );

    overlayState.insert(_searchOverlay);
  }

  // Close the search overlay after detecting one tap outside the search overlay.
  void _resetSearch() {
    ref.read(searchBooksControllerProvider.notifier).reset();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return GestureDetector(
      onTap: _resetSearch,
      child: Scaffold(
        backgroundColor: theme.colorScheme.background,
        bottomNavigationBar: const AppBottomNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 65),
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(
                          AppSpacing.semiLarge.value,
                        ),
                        child: AppText.tab(
                          localizations.bookContinue,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    ContinueBooksList(
                      width: constraints.maxWidth,
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: AppSpacing.semiLarge.value,
                          right: AppSpacing.semiLarge.value,
                          top: AppSpacing.semiLarge.value,
                          bottom: AppSpacing.semiMedium.value,
                        ),
                        child: AppText.tab(
                          localizations.bookNew,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const NewBooksList(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
