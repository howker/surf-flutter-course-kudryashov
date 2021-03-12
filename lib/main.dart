import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme, //darkTheme,
      title: 'TITLE',
      home: //FiltersScreen(),
          VisitingScreen(), //SightListScreen(),

      //     SightDetails(
      //   sight: mocks[0],
      // ),
    );
  }
}
