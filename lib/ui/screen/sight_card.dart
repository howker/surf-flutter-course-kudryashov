import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          //alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              //имитация фото
              height: 188,
            ),
            Positioned(
              top: 96,
              left: 16,
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                color: const Color(0xFFF5F5F5),
                height: 92,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 16, left: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        sight.nameSights,
                        style: textFontStyle,
                        maxLines: 2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2, left: 16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        sight.details,
                        style: smallFontStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 19,
              right: 36,
              child: Container(
                height: 18,
                width: 20,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
