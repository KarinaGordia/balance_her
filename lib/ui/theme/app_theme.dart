import 'package:balance_her/resources/fonts.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w700,
          fontSize: 32,
          height: 40/32
      ),
      displayMedium: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 32/24
      ),
      displaySmall: TextStyle(
        fontFamily: Fonts.sanFranciscoProText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 24/18
      ),
      bodyLarge: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 22/16
      ),
      bodyMedium: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 22/16
      ),
      bodySmall: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 22/16
      ),
      labelLarge: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 20/14
      ),
      labelMedium: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 18/12
      ),
      labelSmall: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          height: 14/10
      ),
    ),
  );
}

abstract class AppColors {
  static const white = Color(0xffffffff);
  static const background = Color(0xfffaf6f0);
  static const surface = Color(0x14ffffff);
  static const onSurface = Color(0x33F2AA91);
  static const primary = Color(0xfff2aa91);
  static const onPrimary = Color(0x6629282F);
  static const secondary = Color(0xff29282f);
  static const onSecondary = Color(0x66FAFAFA);
  static const outline8 = Color(0x1429282F);
  static const outline12 = Color(0x1E29282F);
  static const outline_2 = Color(0xfffd886e);
  static const red = Color(0xfffd886e);
  static const violet = Color(0xffceb5f2);
  static const blue = Color(0xff6ec1fd);
  static const green = Color(0xffa2e492);
}