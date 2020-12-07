import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
            //имитация фото
            height: 188,
            color: Colors.blue,
          ),
          Container(
            child: Column(
              children: [
                Text(sight.nameSights),
                Text(sight.details),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
