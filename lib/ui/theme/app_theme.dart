import 'package:balance_her/resources/fonts.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      titleTextStyle: TextStyle(
        color: AppColors.onPrimary,
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 24 / 18),
    ),
    chipTheme: ChipThemeData(
      showCheckmark: false,
      selectedColor: AppColors.blue,
      backgroundColor: AppColors.surface,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      labelPadding: EdgeInsets.zero,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: AppColors.onSecondaryDark40,
        ),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(47.0),
        color: AppColors.primary,
      ),
      labelStyle: const TextStyle(
        fontFamily: Fonts.sanFranciscoProText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 20 / 14,
        color: AppColors.surface,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: Fonts.sanFranciscoProText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 20 / 14,
        color: AppColors.onPrimary,
      ),
      dividerHeight: 0,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w700,
          fontSize: 32,
          height: 40 / 32,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w700,
          fontSize: 24,
          height: 32 / 24,
        color: Colors.black,),
      displaySmall: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 24 / 18, color: Colors.black,),
      bodyLarge: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 22 / 16, color: Colors.black,),
      bodyMedium: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 22 / 16, color: Colors.black,),
      bodySmall: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 22 / 16, color: Colors.black,),
      labelLarge: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 20 / 14, color: Colors.black,),
      labelMedium: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 18 / 12, color: Colors.black,),
      labelSmall: TextStyle(
          fontFamily: Fonts.sanFranciscoProText,
          fontWeight: FontWeight.w500,
          fontSize: 10,
          height: 14 / 10, color: Colors.black,),
    ),
  );
}
