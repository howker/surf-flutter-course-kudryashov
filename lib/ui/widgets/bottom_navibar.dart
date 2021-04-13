import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/main.dart';
import 'package:places/svg_path_const.dart';

///Нижняя навигационная панель
class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.of(context).pushReplacementNamed(AppRoutes.sightList);
            break;
          case 1:
            print('Map was tapped');
            break;
          case 2:
            Navigator.of(context).pushReplacementNamed(AppRoutes.visiting);
            break;
          case 3:
            Navigator.of(context).pushReplacementNamed(AppRoutes.settings);
            break;
        }
      },
      showSelectedLabels: false,
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            list,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            map,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            heart,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            settings,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
          label: '',
        ),
      ],
    );
  }
}
