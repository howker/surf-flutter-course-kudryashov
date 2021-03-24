import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';

///Экран поиска мест
class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode focusNodeSearchBar = FocusNode();
  List newFoundList = [];
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    focusNodeSearchBar.requestFocus();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: SingleChildScrollView(
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
                children: _buildFoundPlacesList(context),
              ),
              newFoundList.length != 0
                  ? const SizedBox()
                  : Column(
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
            focusNode: focusNodeSearchBar,
            controller: _textEditingController,
            onChanged: (String newValue) {
              if (newValue.endsWith(' ')) _onCompleteUserSearchInput();
            },
            onEditingComplete: _onCompleteUserSearchInput,
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
                newFoundList.clear();
              });
            },
          ),
        ),
      ],
    );
  }

  void _onCompleteUserSearchInput() {
    if (_textEditingController.text != '') {
      newFoundList = mocks
          .where((element) =>
              element.nameSights.contains(_textEditingController.text.trim()))
          .toList();
      newFoundList.forEach((element) => searchHistory.add(element.nameSights));

      setState(() {});
    }
  }

  List<Widget> _buildFoundPlacesList(BuildContext context) {
    List<Widget> foundPlacesListlist = [];
    newFoundList.forEach(
      (element) => foundPlacesListlist.add(
        Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                element.nameSights,
                style: Theme.of(context).textTheme.caption,
              ),
              subtitle: Text(element.type),
              leading: _buildImageCardItem(element),
            ),
            const Divider(),
          ],
        ),
      ),
    );
//if (newFoundList.isEmpty) return NothingFound
    return foundPlacesListlist;
  }

  Widget _buildImageCardItem(element) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          Sight sight = Sight(
            nameSights: element.nameSights,
            lat: element.lat,
            lon: element.lon,
            url: element.url,
            details: element.details,
            type: element.type,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SightDetails(sight: sight),
            ),
          );
        },
        child: Container(
          height: 56,
          width: 56,
          child: Image.network(
            element.url,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildHistoryPlacesList(BuildContext context) {
    List<Widget> searchHistoryList = [];
    searchHistory.forEach(
      (element) => searchHistoryList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              trailing: IconButton(
                icon: const Icon(Icons.close),
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
