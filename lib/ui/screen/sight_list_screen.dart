import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';
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
            SightCard(sight: mocks[0]),
            const SizedBox(height: 16),
            SightCard(sight: mocks[1]),
            const SizedBox(height: 16),
            SightCard(sight: mocks[2]),
          ],
        ),
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
      child: Text(
        title,
        textAlign: TextAlign.left,
        maxLines: 2,
        style: textRegular32DarkGrey,
      ),
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 64.0,
        right: 16.0,
        bottom: 16.0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(136.0);
}
