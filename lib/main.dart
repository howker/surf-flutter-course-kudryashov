import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';

import 'ui/screen/sight_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TITLE',
      home: SightDetails(
        sight: mocks[0],
      ),
    );
  }
}
