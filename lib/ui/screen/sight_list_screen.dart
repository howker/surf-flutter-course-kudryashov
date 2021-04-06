import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/widgets/bottom_navibar.dart';
import 'package:places/ui/widgets/search_bar.dart';
import 'package:places/ui/widgets/sight_card.dart';

/// список карточек интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: listInterestingPlaces,
        searchBar: SearchBar(),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return SightCard(
            sight: mocks[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemCount: mocks.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: Platform.isAndroid
            ? ClampingScrollPhysics()
            : BouncingScrollPhysics(),
      ),
      bottomNavigationBar: const BottomNaviBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatingButtonAddPlace(),
    );
  }

  Widget _buildFloatingButtonAddPlace() {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
      width: 177,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Colors.yellow, Colors.green],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.add),
          const SizedBox(width: 8),
          const Text(sightListScreenAddNewPlace),
        ],
      ),
    );
  }
}

///кастомизированный AppBar
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget searchBar;
  const CustomAppBar({Key key, this.title, this.searchBar}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(136.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            widget.title,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 22),
          widget.searchBar,
        ],
      ),
    );
  }
}
