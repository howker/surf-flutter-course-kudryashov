import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';

///Экран поиска мест
class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  List newFoundList = [];
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          listInterestingPlaces,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNaviBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSearchBar(context),
            const SizedBox(height: 38),
            Text(
              sightSearchScreenYouSearched,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12,
                    color: lmInactiveBlackColor,
                  ),
            ),
            Column(
              children: _buildHistoryPlacesList(context),
            ),
            const SizedBox(height: 14),
            TextButton(
              onPressed: () {
                setState(() {
                  _textEditingController.clear();
                  searchHistory.clear();
                });
              },
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

  Widget _buildTopSearchBar(BuildContext context) {
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
            controller: _textEditingController,
            onChanged: (String newValue) {
              // if (newValue.endsWith(' ')) print(newValue);
              // _textEditingController.clear();
            },
            onEditingComplete: () {
              print(_textEditingController.text);

              newFoundList = mocks
                  .where((element) =>
                      element.nameSights.contains(_textEditingController.text))
                  .toList();
              newFoundList
                  .forEach((element) => searchHistory.add(element.nameSights));

              setState(() {});
            },
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
            onPressed: () {
              _textEditingController.clear();

              setState(() {
                _buildHistoryPlacesList(context);
              });
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildFoundPlacesList(BuildContext context) {
    List<Widget> foundPlacesListlist = [];
    newFoundList.forEach(
      (element) => foundPlacesListlist.add(
        Column(
          children: [
            ListTile(
              title: Text(
                element.nameSights,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );

    return foundPlacesListlist;
  }

  List<Widget> _buildHistoryPlacesList(BuildContext context) {
    List<Widget> searchHistoryList = [];
    searchHistory.forEach(
      (element) => searchHistoryList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    searchHistory.remove(element);
                  });
                },
              ),
              leading: Text(
                element,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );

    return searchHistoryList;
  }
}
