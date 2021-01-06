import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/widgets/sight_card.dart';

/// Экран "Хочу посетить"
class WantToVisitTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SightCard.wantToVisit(mocks[0]),
          SightCard.wantToVisit(mocks[1]),
        ],
      ),
    );
  }
}
