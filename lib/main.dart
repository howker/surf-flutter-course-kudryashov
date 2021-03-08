import 'package:flutter/material.dart';
import 'package:places/mock.dart';
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
      theme: darkTheme, //lightTheme,
      title: 'TITLE',
      home: //SightListScreen(), //VisitingScreen(), //

          SightDetails(
        sight: mocks[0],
      ),
    );
  }
}
