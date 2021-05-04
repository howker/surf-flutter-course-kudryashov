import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/mock.dart';
import 'package:places/ui/widgets/sight_card.dart';

/// Экран "Хочу посетить"
class WantToVisitTab extends StatefulWidget {
  @override
  _WantToVisitTabState createState() => _WantToVisitTabState();
}

class _WantToVisitTabState extends State<WantToVisitTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PlaceInteractor.getFavoritesPlaces(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return AspectRatio(
                aspectRatio: 3 / 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: SightCard.wantToVisit(
                    key: ValueKey(snapshot.data[index].name),
                    place: snapshot.data[index],
                    onRemoveCard: () => onRemoveCard(snapshot.data[index]),
                    onReorderCard: () => setState(() {}),
                    onDismissedCard: () =>
                        onDismissedCard(snapshot.data[index]),
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

  void onRemoveCard(sight) {
    setState(() {
      mocks.remove(sight);
    });
  }

  void onDismissedCard(sight) {
    setState(() {
      onRemoveCard(sight);
    });
  }
}
