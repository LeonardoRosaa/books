import 'package:books/core/core.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppAnimatedBottomBar extends ConsumerWidget {
  const AppAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    required this.items,
    required this.onChanged,
  })  : assert(items.length == 4),
        super(key: key);

  final int selectedIndex;
  final List<BottomNavigationBarItem> items;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.theme;
    final backgroundColor = theme.bottomNavigationBarTheme.backgroundColor!;

    void onTap(int index) {
      ref.read(searchBooksControllerProvider.notifier).reset();
      onChanged(index);
    }

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 65,
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.small.value,
            horizontal: AppSpacing.semiMedium.value,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((item) {
              final index = items.indexOf(item);

              return GestureDetector(
                onTap: () => onTap(index),
                child: _BottomNavigatorItem(
                  key: K.bottomNavigationBarItem(index),
                  item: item,
                  isSelected: index == selectedIndex,
                  maxWidth: context.dimension.width / (items.length),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _BottomNavigatorItem extends StatelessWidget {
  final _duration = const Duration(milliseconds: 150);

  final bool isSelected;

  final BottomNavigationBarItem item;

  final double maxWidth;

  const _BottomNavigatorItem({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return AnimatedContainer(
      width: isSelected ? maxWidth : maxWidth / 2,
      constraints: BoxConstraints(
        maxWidth: isSelected ? 100 : 40,
      ),
      height: 40,
      duration: _duration,
      curve: Curves.linear,
      decoration: BoxDecoration(
        color: isSelected
            ? theme.colorScheme.background
            : theme.bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: maxWidth,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.small.value),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: AppIcon(
                item.label,
                path: item.icon,
                color: theme.colorScheme.primary,
              ),
            ),
            const AppSpace.semiMedium(),
            if (isSelected)
              Flexible(
                child: AppText.paragraph12(
                  item.label,
                  color: theme.colorScheme.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarItem {
  const BottomNavigationBarItem({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;
}
