import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/styles.dart';

final lightTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: lmElevatedButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  canvasColor: lmPrimaryColor,
  scaffoldBackgroundColor: lmPrimaryColor,
  iconTheme: IconThemeData(color: lmPrimaryColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lmPrimaryColor,
    selectedItemColor: lmBottomBarSelectedColor,
    unselectedItemColor: lmBottomBarSelectedColor,
  ),
  textTheme: TextTheme(
    headline6: textRegular32DarkGrey.copyWith(
      color: lmSecondaryColor,
    ),
    headline5: textRegular16Black.copyWith(
      color: lmSecondaryColor,
    ),
    headline4: textRegular14Grey.copyWith(
      color: lmHeadline4Color,
    ),
    headline3: textBold14DarkGrey.copyWith(
      color: lmHeadline3Color,
    ),
    headline2: textBold14DarkGrey.copyWith(
      color: lmSecondaryColor,
    ),
    headline1: textSubtitleRegular18Grey.copyWith(
      color: lmSecondaryColor,
    ),
    subtitle1: textNormal24Black.copyWith(
      color: lmSecondaryColor,
    ),
    subtitle2: textBold14DarkGrey.copyWith(
      color: lmHeadline4Color,
    ),
    bodyText1: textRegular14Grey.copyWith(
      color: lmSecondaryColor,
    ),
    bodyText2: textRegular14White,
    caption: textNormal16Black,
  ),
  primaryColor: lmPrimaryColor,
  primaryColorDark: lmSecondaryColor,
  backgroundColor: lmBackgroundColor,
  sliderTheme: SliderThemeData(
    activeTrackColor: lmRangeSliderActiveColor,
    thumbColor: lmThumbColor,
    trackHeight: 2,
  ),
);

final darkTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: dmElevatedButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  canvasColor: dmPrimaryColor,
  scaffoldBackgroundColor: dmPrimaryColor,
  iconTheme: IconThemeData(color: dmSecondaryColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dmPrimaryColor,
    selectedItemColor: dmBottomBarSelectedColor,
    unselectedItemColor: dmBottomBarSelectedColor,
  ),
  textTheme: TextTheme(
    headline6: textRegular32DarkGrey.copyWith(
      color: dmSecondaryColor,
    ),
    headline5: textRegular16Black.copyWith(
      color: dmSecondaryColor,
    ),
    headline4: textRegular14Grey.copyWith(
      color: dmHeadline4Color,
    ),
    headline3: textBold14DarkGrey.copyWith(
      color: dmHeadline3Color,
    ),
    headline2: textBold14DarkGrey.copyWith(
      color: dmSecondaryColor,
    ),
    headline1: textSubtitleRegular18Grey.copyWith(
      color: dmSecondaryColor,
    ),
    subtitle1: textNormal24Black.copyWith(
      color: dmSecondaryColor,
    ),
    subtitle2: textBold14DarkGrey.copyWith(
      color: dmHeadline4Color,
    ),
    bodyText1: textRegular14Grey.copyWith(
      color: dmSecondaryColor,
    ),
    bodyText2: textRegular14White,
  ),
  primaryColor: dmBlackDarkColor,
  primaryColorDark: dmSecondaryColor,
  backgroundColor: dmBlackDarkColor,
  sliderTheme: SliderThemeData(
    activeTrackColor: dmRangeSliderActiveColor,
    thumbColor: dmThumbColor,
    trackHeight: 2,
  ),
);
