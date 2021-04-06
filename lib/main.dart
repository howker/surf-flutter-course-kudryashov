import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/ui/widgets/sight_card.dart';

final themeModel = ThemeModel();
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    themeModel.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeModel.isDark ? darkTheme : lightTheme,
      title: 'Intresting places',
      home: //AddSightScreen(),
          //SettingsScreen(),
          //FiltersScreen(),
          //SightListScreen(),
          //VisitingScreen(),

          SightDetails(
        sight: mocks[0],
      ),
    );
  }
}
