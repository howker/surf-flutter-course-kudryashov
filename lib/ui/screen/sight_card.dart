import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

/// Карточка интересного места
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
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      sight.nameSights,
                      style: textRegular16Black,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      sight.details,
                      style: textRegular14Grey,
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
