import 'package:balance_her/resources/fonts.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class OnboardingTextStyles {
  static const title = TextStyle(
      color: AppColors.secondary,
      fontFamily: Fonts.sanFranciscoProText,
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 40 / 32);
  static const subtitle = TextStyle(
      color: AppColors.onPrimary,
      fontFamily: Fonts.sanFranciscoProText,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 22 / 16);
  static const buttonText = TextStyle(
      color: AppColors.surface,
      fontFamily: Fonts.sanFranciscoProText,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 22 / 16);
}
