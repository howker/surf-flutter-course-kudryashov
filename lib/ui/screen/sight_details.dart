import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

/// Экран детализации интересного места
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
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              sight.nameSights,
              style: textBold24Black,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Text(
                  sight.type,
                  style: textBold14Black,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'закрыто до 09:00',
                  style: textRegular14Grey,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              sight.details,
              style: textRegular14Grey,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 16, right: 16),
            height: 48,
            color: Colors.green,
            child: Text(
              'ПОСТРОИТЬ МАРШРУТ',
              style: textRegular14White,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: inactiveBlackColor,
                ),
                SizedBox(width: 9),
                Text(
                  'Запланировать',
                  style: textRegular14Grey.copyWith(
                    color: inactiveBlackColor,
                  ),
                ),
                SizedBox(width: 40),
                Icon(Icons.favorite_border),
                SizedBox(width: 9),
                Text(
                  'В избранное',
                  style: textRegular14Grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
