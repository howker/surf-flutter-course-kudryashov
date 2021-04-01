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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            for (var e in mocks)
              AspectRatio(
                aspectRatio: 3 / 2,
                child: LongPressDraggable(
                  feedback: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SightCard.wantToVisit(
                        key: ValueKey(e.nameSights),
                        sight: e,
                        onRemoveCard: () => onRemoveCard(e),
                      ),
                    ),
                  ),
                  child: SightCard.wantToVisit(
                    key: ValueKey(e.nameSights),
                    sight: e,
                    onRemoveCard: () => onRemoveCard(e),
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
