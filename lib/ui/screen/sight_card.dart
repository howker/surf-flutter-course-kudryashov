import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            height: 360,
            color: Colors.blue,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 2),
            child: Text(
              sight.nameSights,
              style: titleFontStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              sight.type,
              style: titleFontStyle,
            ),
          ),
        ],
      ),
    );
  }
}
