import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';
import 'package:places/ui/widgets/search_bar.dart';

class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: listInterestingPlaces,
        searchBar: SearchBarSearch(
          textEditingController: textEditingController,
        ),
      ),
      bottomNavigationBar: BottomNaviBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 38),
            Text(
              sightSearchScreenYouSearched,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12,
                    color: lmInactiveBlackColor,
                  ),
            ),
            const SizedBox(height: 14),
            TextButton(
              onPressed: () {},
              child: Text(
                sightSearchScreenClear,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.green),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Верхнее поле поиска для экрана SightSearchScreen
class SearchBarSearch extends SearchBar {
  final TextEditingController textEditingController;

  SearchBarSearch({this.textEditingController});
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
            controller: textEditingController,
            onChanged: (String newValue) {},
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
            icon: const Icon(Icons.cancel),
            color: Theme.of(context).primaryColorDark,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
