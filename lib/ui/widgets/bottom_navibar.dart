import 'package:flutter/material.dart';
import 'package:places/appicons.dart';
import 'package:places/colors.dart';

///Нижняя навигационная панель
class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: backgroundBlackColor,
      selectedItemColor: backgroundBlackColor,
      showSelectedLabels: false,
      currentIndex: 1,
      items: [
        const BottomNavigationBarItem(
          icon: const Icon(Appicons.list),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: const Icon(Appicons.map),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: const Icon(Appicons.heartfull),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: const Icon(Appicons.settings),
          label: '',
        ),
      ],
    );
  }
}
