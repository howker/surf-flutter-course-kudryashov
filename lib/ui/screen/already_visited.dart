import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/widgets/sight_card.dart';

/// Экран "Уже посетил"
class AlreadyVisitedTab extends StatefulWidget {
  @override
  _AlreadyVisitedTabState createState() => _AlreadyVisitedTabState();
}

class _AlreadyVisitedTabState extends State<AlreadyVisitedTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Place>>(
      future: PlaceInteractor.getVisitPlaces(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 3 / 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: SightCard.alreadyVisited(
                    key: ValueKey(snapshot.data[index].name),
                    place: snapshot.data[index],
                    onRemoveCard: () => onRemoveCard(snapshot.data[index]),
                    onReorderCard: () => setState(() {}),
                    onDismissedCard: () =>
                        onDismissedCard(snapshot.data[index]),
                    candidateDataList: snapshot.data,
                  ),
                ),
              );
            },
            itemCount: snapshot.data.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          );
        } else
          return SizedBox.shrink();
      },
    );
  }

  void onRemoveCard(place) {
    setState(() {
      PlaceInteractor.removeFromFavorites(place);
    });
  }

  void onDismissedCard(place) {
    setState(() {
      onRemoveCard(place);
    });
  }
}
