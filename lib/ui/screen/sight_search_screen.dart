import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/data/interactor/search_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/redux/action/search_action.dart';
import 'package:places/redux/state/app_state.dart';
import 'package:places/redux/state/search_state.dart';
import 'package:places/styles.dart';
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
  List<Place> newFoundList = [];

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
      body: StoreConnector<AppState, SearchState>(
        converter: (store) => store.state.searchState,
        onInit: (store) => store.dispatch(GetSearchHistoryAction()),
        builder: (BuildContext context, state) {
          if (state is SearchLoadingState) {
            print('Загружаем результаты Поиска или Историю $state');

            return _buildLoader();
          } else if (state is SearchResultHistoryState) {
            print('История запросов ${state.result}');
            return Column(
              children: _buildHistoryPlacesList(context),
            );
          } else if (state is SearchResultState) {
            print('Результаты поиска ${state.result}');

            if (state.result.isEmpty) {
              return Column(
                children: _searchErrorState(),
              );
            } else {
              return _buildSearchResult(state.result);
            }
          } else if (state is SearchErrorState) {
            return Column(
              children: _searchErrorState(),
            );
          }
          return _buildLoader();
        },
      ),
    );
  }

  Padding _buildSearchResult(List<Place> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopSearchBar(context),
            const SizedBox(height: 38),

            //searchInteractor.searchPlaces(_textEditingController.text.trim()),

            //snapshot.data.forEach((element) =>
            // SearchInteractor.searchHistory.add(element.name));
            //SearchInteractor.placesListStorage = snapshot.data;
            ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Place place = Place(
                          name: data[index].name,
                          lat: data[index].lat,
                          lng: data[index].lng,
                          urls: data[index].urls,
                          description: data[index].description,
                          placeType: data[index].placeType,
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
                          data[index].name,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        subtitle: Text(
                          data[index].placeType,
                          style: textRegular14Grey,
                        ),
                        leading: _buildImageCardItem(data[index]),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
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
            },
          ),
        ),
      ],
    );
  }

  void _onCompleteUserSearchInput() async {
    if (_textEditingController.text != '') {
      StoreProvider.of<AppState>(context).dispatch(
          GetSearchResultAction(keywords: _textEditingController.text));
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
                    setState(() {
                      SearchInteractor.searchHistory.remove(element);
                    });
                  }),
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

  /// лоадер при ожидании
  Widget _buildLoader() {
    return Column(
      children: [
        _buildTopSearchBar(context),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: const CircularProgressIndicator(),
              width: 40,
              height: 40,
            ),
          ),
        ),
      ],
    );
  }
}
