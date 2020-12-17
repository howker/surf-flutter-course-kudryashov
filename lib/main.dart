import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TITLE',
      home: SightListScreen(),
      //SightDetails(
      //sight: mocks[0],
      //),
    );
  }
}
