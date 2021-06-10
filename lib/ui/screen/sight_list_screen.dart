import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/places_filter_request_dto.dart';
import 'package:places/main.dart';
import 'package:places/mock.dart';
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
    context.read<PlaceInteractor>().getPlaces(
          PlacesFilterRequestDto(
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
              child: StreamBuilder<List<Place>>(
                stream: context.read<PlaceInteractor>().placeStream,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.isEmpty) {
                      return const SizedBox.shrink();
                    } else
                      return SizedBox(
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SightCard(
                                place: Place(
                                  name: snapshot.data[index].name,
                                  lat: snapshot.data[index].lat,
                                  lng: snapshot.data[index].lng,
                                  urls: snapshot.data[index].urls,
                                  description: snapshot.data[index].description,
                                  id: snapshot.data[index].id,
                                ),
                                candidateDataList: snapshot.data,
                              ),
                            );
                          },
                        ),
                      );
                  } else if (snapshot.hasError) {
                    return ErrorScreen();
                  } else
                    return const WaitingIndicator();
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
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                context.read<PlaceInteractor>().getPlaces(
                      PlacesFilterRequestDto(
                        lat: GeoUtils.getMyCoordinates()['lat'],
                        lng: GeoUtils.getMyCoordinates()['lon'],
                        radius: 10000.0,
                        typeFilter: mockTypeFilters,
                        nameFilter: '',
                      ),
                    );
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: StreamBuilder<List<Place>>(
                    stream: context.read<PlaceInteractor>().placeStream,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.isEmpty) {
                          return const SizedBox.shrink();
                        } else
                          return SizedBox(
                            width: double.infinity,
                            child: SightCard(
                              place: Place(
                                name: snapshot.data[index].name,
                                lat: snapshot.data[index].lat,
                                lng: snapshot.data[index].lng,
                                urls: snapshot.data[index].urls,
                                description: snapshot.data[index].description,
                                id: snapshot.data[index].id,
                              ),
                              candidateDataList: snapshot.data,
                            ),
                          );
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                        );
                      } else
                        return const WaitingIndicator();
                    },
                  ),
                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
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
