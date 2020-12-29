import 'package:flutter/material.dart';
import 'package:places/appicons.dart';
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
            child: Image.network(
              sight.url,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
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
              style: Theme.of(context).textTheme.subtitle1, //textBold24Black,
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
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'закрыто до 09:00',
                  style: Theme.of(context).textTheme.headline4,
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
              style: Theme.of(context).textTheme.bodyText1,
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
                  Appicons.calendar,
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
                Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).primaryColorDark,
                ),
                const SizedBox(width: 9),
                Text(
                  'В избранное',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
