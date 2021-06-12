import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:places/colors.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/places_filter_request_dto.dart';
import 'package:places/main.dart';
import 'package:places/mock.dart';
import 'package:places/store/place_list/place_list_store.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/error_screen.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/ui/widgets/waiting_indicator.dart';
import 'package:provider/provider.dart';

/// список карточек интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return PortraitModeList();
          } else {
            return LandscapeModeList();
          }
        },
      ),
      bottomNavigationBar: const BottomNaviBar(current: 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButtonAddPlace(context: context),
    );
  }
}

/// Список карточек для портретного режима
class PortraitModeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlaceListStore _store = PlaceListStore(context.read<PlaceInteractor>());
    _store.getFilteredPlace(
      filter: PlacesFilterRequestDto(
        lat: GeoUtils.getMyCoordinates()['lat'],
        lng: GeoUtils.getMyCoordinates()['lon'],
        radius: 10000.0,
        typeFilter: mockTypeFilters,
        nameFilter: '',
      ),
    );
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 25, bottom: 20),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: AppBarPersistentHeaderDelegate(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: SearchBar(),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Observer(
                builder: (BuildContext context) {
                  final future = _store.listPlacesFuture;
                  if (future == null) {
                    return const WaitingIndicator();
                  }
                  if (future.status == FutureStatus.pending) {
                    return const WaitingIndicator();
                  }

                  if (future.status == FutureStatus.rejected) {
                    return ErrorScreen();
                  }

                  if (future.status == FutureStatus.fulfilled) {
                    return ListView.builder(
                      itemCount: future.result.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SightCard(
                            place: Place(
                              name: future.result[index].name,
                              lat: future.result[index].lat,
                              lng: future.result[index].lng,
                              urls: future.result[index].urls,
                              description: future.result[index].description,
                              id: future.result[index].id,
                            ),
                            candidateDataList: future.result,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Список карточек для горизонтального режима
class LandscapeModeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlaceListStore _store = PlaceListStore(context.read<PlaceInteractor>());
    _store.getFilteredPlace(
      filter: PlacesFilterRequestDto(
        lat: GeoUtils.getMyCoordinates()['lat'],
        lng: GeoUtils.getMyCoordinates()['lon'],
        radius: 10000.0,
        typeFilter: mockTypeFilters,
        nameFilter: '',
      ),
    );
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 25, bottom: 20),
            sliver: SliverPersistentHeader(
              pinned: true,
              delegate: AppBarPersistentHeaderDelegate(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: SearchBar(),
                ),
              ],
            ),
          ),
          Observer(
            builder: (BuildContext context) {
              final future = _store.listPlacesFuture;
              if (future == null) {
                return SliverToBoxAdapter(child: const WaitingIndicator());
              }
              if (future.status == FutureStatus.pending) {
                return SliverToBoxAdapter(child: const WaitingIndicator());
              }

              if (future.status == FutureStatus.rejected) {
                return ErrorScreen();
              }
              if (future.status == FutureStatus.fulfilled) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          child: SightCard(
                            place: Place(
                              name: future.result[index].name,
                              lat: future.result[index].lat,
                              lng: future.result[index].lng,
                              urls: future.result[index].urls,
                              description: future.result[index].description,
                              id: future.result[index].id,
                            ),
                            candidateDataList: future.result,
                          ),
                        ),
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

///кастомизированный AppBar
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Text title;

  const CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(136.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Container(
                padding: EdgeInsets.only(top: 30),
                color: Theme.of(context).canvasColor,
                child: widget.title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///AppBar делегат
class AppBarPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return CustomAppBar(
      title: shrinkOffset > 40
          ? Text(
              listInterestingPlacesMin,
              style: textRegular18Black,
              textAlign: TextAlign.center,
            )
          : Text(
              listInterestingPlaces,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: lmBackgroundBlackColor),
            ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

///Кнопка добавления нового места
class FloatingButtonAddPlace extends StatelessWidget {
  const FloatingButtonAddPlace({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.newPlace);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
        width: 177,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Colors.yellow, Colors.green],
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.add),
            const SizedBox(width: 8),
            const Text(sightListScreenAddNewPlace),
          ],
        ),
      ),
    );
  }
}
