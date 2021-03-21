import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

/// Верхнее поле для поиска
class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: lmBackgroundColor,
          ),
          height: 40,
          width: double.infinity,
          child: TextField(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SightSearchScreen(),
                ),
              );
            },
            readOnly: true,
            textCapitalization: TextCapitalization.sentences,
            style: Theme.of(context).textTheme.caption,
            cursorWidth: 1,
            cursorHeight: 24,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 7, bottom: 10),
              prefixIcon: IconButton(
                icon: SvgPicture.asset(
                  searchSvg,
                  color: lmInactiveBlackColor,
                ),
                onPressed: () {},
                color: Theme.of(context).primaryColorDark,
              ),
              hintText: searchBarHint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: lmInactiveBlackColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lmBackgroundColor, width: 1.0),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -5,
          child: IconButton(
            icon: SvgPicture.asset(
              filterSvg,
              color: Colors.green,
            ),
            color: Theme.of(context).primaryColorDark,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => FiltersScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
