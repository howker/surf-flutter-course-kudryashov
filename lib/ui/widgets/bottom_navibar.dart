import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/svg_path_const.dart';

///Нижняя навигационная панель
class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onBottomItemTap,
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

  void _onBottomItemTap(index) {
    print(index);
  }
}
