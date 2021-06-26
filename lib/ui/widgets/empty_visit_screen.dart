import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';

class EmptyVisitScreen extends StatelessWidget {
  final String icon;
  final String text;
  const EmptyVisitScreen({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: SvgPicture.asset(
              icon,
              color: lmInactiveBlackColor,
              width: 53,
              height: 53,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            empty,
            style: textSubtitleRegular18Grey,
          ),
          Text(
            text,
            style: textSmallRegular14Grey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
