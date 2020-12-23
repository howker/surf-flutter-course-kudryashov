import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      items: [
        const BottomNavigationBarItem(
          icon: const Icon(Icons.list_alt_rounded),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: const Icon(Icons.map_outlined),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.gear),
          label: '',
        ),
      ],
    );
  }
}
