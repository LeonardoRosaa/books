import 'package:books/core/core.dart';
import 'package:books/gen/assets.gen.dart';
import 'package:books/presentation/presentation.dart';
import 'package:flutter/widgets.dart' hide BottomNavigationBarItem;

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int index = 0;

  void onChanged(int i) {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppAnimatedBottomBar(
      selectedIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Assets.icons.home,
          label: localizations.home,
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.stack,
          label: localizations.stack,
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.compass,
          label: localizations.compass,
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.stick,
          label: localizations.stick,
        ),
      ],
      onChanged: onChanged,
    );
  }
}
