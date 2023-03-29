import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.tertiary,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 0.75),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.semiLarge.value,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search for something',
                          hintStyle: theme.textTheme.displaySmall?.copyWith(
                            color: theme.colorScheme.outline.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 16,
                      child: AppIcon.search(
                        localizations.play,
                        color: theme.colorScheme.outline.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SafeArea(
              top: false,
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
        ],
      ),
    );
  }
}
