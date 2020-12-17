import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

/// Карточка интересного места
class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AspectRatio(
        aspectRatio: 3 / 1.4,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              height: 188,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: const ExactAssetImage('res/images/hole_china.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 96,
              left: 16,
              child: Container(
                height: 92,
                width: 380,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(15),
                    bottomRight: const Radius.circular(15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        sight.nameSights,
                        style: textRegular16Black,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Text(
                          sight.details,
                          style: textRegular14Grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 19,
              left: 36,
              child: Text(
                sight.type,
                style: textBold14Black.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 19,
              right: 36,
              child: Container(
                height: 18,
                width: 20,
                child: Image.asset('res/images/heart.jpg'),
              ),
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
