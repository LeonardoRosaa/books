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
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.semiLarge.value,
                    ),
                    child: AppText.tab(
                      localizations.bookContinue,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                ContinueBooksList(
                  height: constraints.maxHeight / 4.2,
                  width: constraints.maxWidth,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppSpacing.semiLarge.value,
                      right: AppSpacing.semiLarge.value,
                      bottom: AppSpacing.medium.value,
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
    );
  }
}
