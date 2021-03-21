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
  SightCard sightCard = SightCard(
    sight: mocks[0],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: listInterestingPlaces,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SightCard(sight: mocks[3]),
            const SizedBox(height: 16),
            SightCard(sight: mocks[1]),
            const SizedBox(height: 16),
            SightCard(sight: mocks[2]),
            const SizedBox(height: 16),
            SightCard(sight: mocks[0]),
          ],
        ),
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
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 22),
          SearchBar(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(136.0);
}
