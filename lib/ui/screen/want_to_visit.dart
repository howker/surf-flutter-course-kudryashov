import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/screen/sight_card.dart';

/// Экран "Хочу посетить"
class WantToVisitTab extends SightCard {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SightCard.wanttovisit(mocks[0]),
          SightCard.wanttovisit(mocks[1]),
        ],
      ),
    );
  }
}
