import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/styles.dart';

final lightTheme = ThemeData(
  canvasColor: lmprimaryColor,
  scaffoldBackgroundColor: lmprimaryColor,
  iconTheme: IconThemeData(color: lmprimaryColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lmprimaryColor,
    selectedItemColor: lmBottomBarSelectedColor,
    unselectedItemColor: lmBottomBarSelectedColor,
  ),
  textTheme: TextTheme(
    headline6: textRegular32DarkGrey.copyWith(
      color: lmsecondaryColor,
    ),
    headline5: textRegular16Black.copyWith(
      color: lmsecondaryColor,
    ),
    headline4: textRegular14Grey.copyWith(
      color: lmheadline4Color,
    ),
    headline3: textBold14G.copyWith(
      color: lmheadline3Color,
    ),
    headline2: textBold14G.copyWith(
      color: lmsecondaryColor,
    ),
    headline1: textSubtitleRegular18Grey.copyWith(
      color: lmsecondaryColor,
    ),
    subtitle1: textNormal24Black.copyWith(
      color: lmsecondaryColor,
    ),
    subtitle2: textBold14G.copyWith(
      color: lmheadline4Color,
    ),
    bodyText1: textRegular14Grey.copyWith(
      color: lmsecondaryColor,
    ),
  ),
  primaryColor: lmprimaryColor,
  primaryColorDark: lmsecondaryColor,
  backgroundColor: lmbackgroundColor,
);

final darkTheme = ThemeData(
  canvasColor: dmprimaryColor,
  scaffoldBackgroundColor: dmprimaryColor,
  iconTheme: IconThemeData(color: dmsecondaryColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dmprimaryColor,
    selectedItemColor: dmBottomBarSelectedColor,
    unselectedItemColor: dmBottomBarSelectedColor,
  ),
  textTheme: TextTheme(
    headline6: textRegular32DarkGrey.copyWith(
      color: dmsecondaryColor,
    ),
    headline5: textRegular16Black.copyWith(
      color: dmsecondaryColor,
    ),
    headline4: textRegular14Grey.copyWith(
      color: dmheadline4Color,
    ),
    headline3: textBold14G.copyWith(
      color: dmheadline3Color,
    ),
    headline2: textBold14G.copyWith(
      color: dmsecondaryColor,
    ),
    headline1: textSubtitleRegular18Grey.copyWith(
      color: dmsecondaryColor,
    ),
    subtitle1: textNormal24Black.copyWith(
      color: dmsecondaryColor,
    ),
    subtitle2: textBold14G.copyWith(
      color: dmheadline4Color,
    ),
    bodyText1: textRegular14Grey.copyWith(
      color: dmsecondaryColor,
    ),
  ),
  primaryColor: dmBlackDarkColor,
  primaryColorDark: dmsecondaryColor,
  backgroundColor: dmBlackDarkColor,
);
