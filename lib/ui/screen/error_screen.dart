import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/svg_path_const.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          error,
          color: lmInactiveBlackColor,
        ),
        SizedBox(height: 24),
        Text(
          'Ошибка',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: lmInactiveBlackColor),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: 150,
          child: Text(
            'Что то пошло не так\nПопробуйте позже.',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
