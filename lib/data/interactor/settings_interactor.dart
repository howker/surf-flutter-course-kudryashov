import 'package:flutter/material.dart';

class SettingsInteractor extends ChangeNotifier {
  static bool isDark = false;

  set changeTheme(bool val) {
    isDark = val;
    notifyListeners();
  }
}
