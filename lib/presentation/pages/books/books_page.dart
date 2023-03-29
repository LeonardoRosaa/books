import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AppText.tab(
                      'Continue',
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
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: AppText.tab(
                      'New',
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
