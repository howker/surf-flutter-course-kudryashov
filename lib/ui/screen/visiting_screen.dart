import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/appicons.dart';
import 'package:places/colors.dart';
import 'package:places/text_string_const.dart';
import 'package:places/styles.dart';
import 'package:places/ui/screen/already_visited.dart';
import 'package:places/ui/screen/want_to_visit.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';

/// Экран "Хочу посетить/Посещенные места"
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () {
        if (!_tabController.indexIsChanging) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          favorites,
          style: textRegular18Black,
        ),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(82),
          child: _buildTabBar(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildEmptyState(Appicons.card, markPlaces), //WantToVisitTab(),
          buildEmptyState(Appicons.go, finishRoute), //AlreadyVisitedTab(),
        ],
      ),
      bottomNavigationBar: BottomNaviBar(),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 40,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  wantToVisit,
                  style: _tabController.index == 0
                      ? textBoldRegular14White
                      : textBoldRegular14Grey,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: _tabController.index == 0
                      ? secondaryColor
                      : backgroundColor,
                ),
                height: 40,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  alreadyVisited,
                  style: _tabController.index == 1
                      ? textBoldRegular14White
                      : textBoldRegular14Grey,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: _tabController.index == 1
                      ? secondaryColor
                      : backgroundColor,
                ),
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyState(IconData icon, String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: primaryColor,
            child: Icon(
              icon,
              color: inactiveBlackColor,
              size: 53,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            empty,
            style: textSubtitleRegular18Grey,
          ),
          Text(
            text,
            style: textSmallRegular14Grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
