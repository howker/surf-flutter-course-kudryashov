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
            child: Image.asset(
              'res/images/hole_china.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
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
          const SizedBox(
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
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  'закрыто до 09:00',
                  style: textRegular14Grey,
                ),
              ],
            ),
          ),
          const SizedBox(
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
          const SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 16, right: 16),
            height: 48,
            color: Colors.green,
            child: const Text(
              'ПОСТРОИТЬ МАРШРУТ',
              style: textRegular14White,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 33),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  color: inactiveBlackColor,
                ),
                const SizedBox(width: 9),
                Text(
                  'Запланировать',
                  style: textRegular14Grey.copyWith(
                    color: inactiveBlackColor,
                  ),
                ),
                const SizedBox(width: 40),
                const Icon(Icons.favorite_border),
                const SizedBox(width: 9),
                const Text(
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
