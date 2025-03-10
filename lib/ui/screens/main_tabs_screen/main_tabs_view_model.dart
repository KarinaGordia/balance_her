import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class MainTabsViewModel {

  Color setIndicatorColor(int index) {
    switch (index) {
      case 0: return AppColors.blue;
      case 1: return AppColors.red;
      case 2: return AppColors.violet;
      case 3: return AppColors.green;
    }

    return AppColors.blue;
  }
}