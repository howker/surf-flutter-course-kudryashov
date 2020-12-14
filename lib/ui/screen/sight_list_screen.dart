import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/sight_card.dart';

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
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sightCard,
            SizedBox(height: 16),
            sightCard,
            SizedBox(height: 16),
            sightCard,
            SizedBox(height: 16),
            sightCard,
            SizedBox(height: 16),
            sightCard,
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      toolbarHeight: 136,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        listInterestingPlaces,
        style: textRegular32DarkGrey,
      ),
    );
  }
}
