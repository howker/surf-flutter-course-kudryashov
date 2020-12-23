import 'package:flutter/material.dart';
import 'package:places/appicons.dart';
import 'package:places/colors.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';

/// Пустой экран "Уже посетил"
class AlreadyVisitedTabEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: primaryColor,
            child: Icon(
              Appicons.go,
              color: Colors.grey,
              size: 53,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            empty,
            style: textSubtitleRegular18Grey,
          ),
          Text(
            finishRoute,
            style: textSmallRegular14Grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
