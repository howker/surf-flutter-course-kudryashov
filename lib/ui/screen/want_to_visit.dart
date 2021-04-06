import 'dart:io';

import 'package:flutter/material.dart';
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return AspectRatio(
          aspectRatio: 3 / 2,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: SightCard.wantToVisit(
              key: ValueKey(mocks[index].nameSights),
              sight: mocks[index],
              onRemoveCard: () => onRemoveCard(mocks[index]),
              onReorderCard: () => setState(() {}),
              onDismissedCard: () => onDismissedCard(mocks[index]),
            ),
          ),
        );
      },
      itemCount: mocks.length,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: Platform.isAndroid
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
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
