import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/data/interactor/settings_interactor.dart';

import 'package:places/main.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';
import 'package:provider/provider.dart';

///Экран настроек
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          settingsScreenTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 52),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  darkThemeSettings,
                  style: Theme.of(context).textTheme.caption,
                ),
                CupertinoSwitch(
                  activeColor: Colors.green,
                  trackColor: lmInactiveBlackColor,
                  value: context.watch<SettingsInteractor>().getIsDark,
                  onChanged: (bool newValue) {
                    context.read<SettingsInteractor>().changeTheme(newValue);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  watchTutorial,
                  style: Theme.of(context).textTheme.caption,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.onboarding);
                  },
                  child: Icon(Icons.info_outline, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(current: 3),
    );
  }
}
