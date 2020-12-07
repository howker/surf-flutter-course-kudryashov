import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails({this.sight});
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
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                Text(
                  sight.type,
                  style: smallBoldFontStyle,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'закрыто до 09:00',
                  style: smallFontStyle,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Text(
              sight.details,
              style: smallFontStyle,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            height: 48,
            color: Colors.green,
            child: Text(
              'ПОСТРОИТЬ МАРШРУТ',
              style: buttonFontStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: const Color(0xFF7C7E92),
                ),
                SizedBox(width: 9),
                Text(
                  'Запланировать',
                  style: smallFontStyle.copyWith(
                    color: const Color(0xFF7C7E92),
                  ),
                ),
                SizedBox(width: 40),
                Icon(Icons.favorite_border),
                SizedBox(width: 9),
                Text(
                  'В избранное',
                  style: smallFontStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
