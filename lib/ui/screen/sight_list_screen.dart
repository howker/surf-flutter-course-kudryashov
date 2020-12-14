// список карточек интересных мест

import 'package:flutter/material.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';

/// список карточек интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
