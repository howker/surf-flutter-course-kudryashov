import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/mock.dart';
import 'package:places/styles.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';

///Экран поиска мест
enum States {
  error,
  found,
  history,
  empty,
}

class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode focusNodeSearchBar = FocusNode();
  List<Place> newFoundList = [];
  States state = States.history;

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
      bottomNavigationBar: BottomNaviBar(current: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopSearchBar(context),
              const SizedBox(height: 38),
              state == States.found
                  ? FutureBuilder<List<Place>>(
                      future: searchInteractor
                          .searchPlaces(_textEditingController.text.trim()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          snapshot.data.forEach((element) =>
                              SearchInteractor.searchHistory.add(element.name));
                          SearchInteractor.placesListStorage = snapshot.data;
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Place place = Place(
                                        name: snapshot.data[index].name,
                                        lat: snapshot.data[index].lat,
                                        lng: snapshot.data[index].lng,
                                        urls: snapshot.data[index].urls,
                                        description:
                                            snapshot.data[index].description,
                                        placeType:
                                            snapshot.data[index].placeType,
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SightDetails(place: place),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.all(0),
                                      title: Text(
                                        snapshot.data[index].name,
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                      subtitle: Text(
                                        snapshot.data[index].placeType,
                                        style: textRegular14Grey,
                                      ),
                                      leading: _buildImageCardItem(
                                          snapshot.data[index]),
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          );
                        } else
                          return SizedBox.shrink();
                      },
                    )
                  : const SizedBox(),
              state == States.history
                  ? Column(
                      children: _buildHistoryPlacesList(context),
                    )
                  : const SizedBox(),
              const SizedBox(height: 14),
              state == States.error
                  ? Column(
                      children: _searchErrorState(),
                    )
                  : const SizedBox(),
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
              newFoundList.clear();

              state = States.history;

              if (SearchInteractor.searchHistory.isEmpty) state = States.empty;

              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  void _onCompleteUserSearchInput() async {
    if (_textEditingController.text != '') {
      state = States.found;
      setState(() {});
    }
  }

  Widget _buildImageCardItem(element) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 56,
        width: 56,
        child: Image.network(
          element.urls[0],
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
    );
  }

  List<Widget> _buildHistoryPlacesList(BuildContext context) {
    List<Widget> searchHistoryList = [
      SearchInteractor.searchHistory.isNotEmpty
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  sightSearchScreenYouSearched,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 12,
                        color: lmInactiveBlackColor,
                      ),
                ),
              ],
            )
          : const SizedBox(),
    ];
    SearchInteractor.searchHistory.forEach(
      (element) => searchHistoryList.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(
                    () {
                      SearchInteractor.searchHistory.remove(element);
                      if (SearchInteractor.searchHistory.isEmpty)
                        state = States.empty;
                    },
                  );
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

    SearchInteractor.searchHistory.isNotEmpty
        ? searchHistoryList.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _textEditingController.clear();
                      SearchInteractor.searchHistory.clear();
                      state = States.empty;
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
          )
        : const SizedBox();

    return searchHistoryList;
  }

  List<Widget> _searchErrorState() {
    List<Widget> searchErrorState = [
      Center(
        child: Column(
          children: [
            const SizedBox(height: 170),
            SvgPicture.asset(
              searchSvg,
              color: lmInactiveBlackColor,
              width: 50,
              height: 48,
            ),
            const SizedBox(height: 32),
            const Text(
              sightSearchScreenNothingFound,
              style: textSubtitleRegular18Grey,
            ),
            const SizedBox(height: 8),
            const Text(
              sightSearchScreenTryToChange,
              style: textSmallRegular14Grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ];

    return searchErrorState;
  }
}
