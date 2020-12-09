import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  const SightCard({this.sight});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 188,
          ),
          Positioned(
            top: 96,
            left: 16,
            child: Container(
              height: 92,
              width: 380,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      sight.nameSights,
                      style: textFontStyle,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 2,
                      left: 16,
                      right: 16,
                    ),
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
              left: 36,
              child: Text(
                sight.type,
                style: smallBoldFontStyle.copyWith(color: Colors.white),
              )),
          Positioned(
            top: 19,
            right: 36,
            child: Container(
              height: 18,
              width: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
