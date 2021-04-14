import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/main.dart';
import 'package:places/svg_path_const.dart';

///Нижняя навигационная панель
class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key key,
    this.current,
  }) : super(key: key);
  final int current;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (current) {
        switch (current) {
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
      currentIndex: current,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 0 ? listFill : list,
            color: current == 0
                ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 1 ? mapFill : map,
            color: current == 0
                ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 2 ? heartFill : heart,
            color: current == 0
                ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            current == 3 ? settingsFill : settings,
            color: current == 0
                ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                : Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
          ),
          label: '',
        ),
      ],
    );
  }
}
