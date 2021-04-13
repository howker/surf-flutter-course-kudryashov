import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/onboarding_screen.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

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
      home: SplashScreen(),
      routes: {
        AppRoutes.visiting: (context) => VisitingScreen(),
        AppRoutes.settings: (context) => SettingsScreen(),
        AppRoutes.onboarding: (context) => OnboardingScreen(),
        AppRoutes.sightList: (context) => SightListScreen(),
        AppRoutes.newPlace: (context) => AddSightScreen(),
      },
    );
  }
}

///Описание маршрутов
class AppRoutes {
  static const String sightList = '/sightList';
  static const String visiting = '/visiting';
  static const String settings = '/settings';
  static const String onboarding = '/onboarding';
  static const String newPlace = '/newPlace';
}
