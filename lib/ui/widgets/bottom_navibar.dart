import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

///Нижняя навигационная панель
class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'res/icons/List.svg',
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),

          //const Icon(Icons.list),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'res/icons/Map.svg',
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'res/icons/Heart.svg',
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'res/icons/Settings.svg',
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
      ],
    );
  }
}
