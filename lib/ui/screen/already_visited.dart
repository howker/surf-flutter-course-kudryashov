import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/widgets/sight_card.dart';

/// Экран "Уже посетил"
class AlreadyVisitedTab extends StatefulWidget {
  @override
  _AlreadyVisitedTabState createState() => _AlreadyVisitedTabState();
}

class _AlreadyVisitedTabState extends State<AlreadyVisitedTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            for (var e in mocks)
              AspectRatio(
                aspectRatio: 3 / 2,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width),
                  child: SightCard.alreadyVisited(
                    key: ValueKey(e.nameSights),
                    sight: e,
                    onRemoveCard: () => onRemoveCard(e),
                    onReorderCard: () => setState(() {}),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void onRemoveCard(sight) {
    setState(() {
      mocks.remove(sight);
    });
  }
}
