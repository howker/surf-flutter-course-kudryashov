import 'package:flutter/material.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';

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
      title: RichText(
        text: TextSpan(
          text: 'С',
          style: textStyle,
          children: [
            TextSpan(
              text: placesN,
              style: textStyle1,
            ),
            TextSpan(
              text: 'и',
              style: textStyle2,
            ),
            TextSpan(
              text: nPlaces,
              style: textStyle3,
            ),
          ],
        ),
        textAlign: TextAlign.left,
        maxLines: 2,
      ),
    );
  }
}
