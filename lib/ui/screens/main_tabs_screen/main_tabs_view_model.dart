import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class MainTabsViewModel extends ChangeNotifier {
  var _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;
  void setCurrentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }

  Color setIndicatorColor() {
    switch (_currentTabIndex) {
      case 0: return AppColors.blue;
      case 1: return AppColors.red;
      case 2: return AppColors.violet;
      case 3: return AppColors.green;
    }

    return AppColors.blue;
  }
}