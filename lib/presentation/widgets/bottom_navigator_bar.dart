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
        BottomNavigationBarItem(icon: Assets.icons.home, label: 'Home'),
        BottomNavigationBarItem(icon: Assets.icons.stack, label: 'Stack'),
        BottomNavigationBarItem(icon: Assets.icons.compass, label: 'Compass'),
        BottomNavigationBarItem(icon: Assets.icons.stick, label: 'Stick'),
      ],
      onChanged: onChanged,
    );
  }
}
