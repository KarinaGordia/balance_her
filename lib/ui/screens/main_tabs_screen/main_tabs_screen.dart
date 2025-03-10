import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/ui/screens/main_tabs_screen/main_tabs_view_model.dart';
import 'package:balance_her/ui/screens/tabs/tabs.dart';
import 'package:balance_her/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatefulWidget {
  const MainTabsScreen({super.key});

  @override
  State<MainTabsScreen> createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen> {
  var _currentTabIndex = 0;

  void setCurrentTabIndex(int value) {
    setState(() {
      _currentTabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsViewModel>();
    var primaryTabColor = model.setIndicatorColor(_currentTabIndex);
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentTabIndex,
        children: [
          ChangeNotifierProvider(
            create: (_) => MainScreenViewModel(primaryColor: primaryTabColor,),
            child: const MainScreen(),
          ),
          const Text('health', style: TextStyle(color: Colors.red)),
          const Text('habits', style: TextStyle(color: Colors.red)),
          const Text('settings', style: TextStyle(color: Colors.red)),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 32.0,
          right: 32,
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: primaryTabColor,
          destinations: const [
            NavigationDestination(
                icon: Icon(AppIcons.home),
                selectedIcon: Icon(
                  AppIcons.home,
                  color: AppColors.surface,
                ),
                label: ''),
            NavigationDestination(
                icon: Icon(AppIcons.cards_heart),
                selectedIcon: Icon(
                  AppIcons.cards_heart,
                  color: AppColors.surface,
                ),
                label: ''),
            NavigationDestination(
                icon: Icon(AppIcons.run),
                selectedIcon: Icon(
                  AppIcons.run,
                  color: AppColors.surface,
                ),
                label: ''),
            NavigationDestination(
                icon: Icon(AppIcons.settings),
                selectedIcon: Icon(
                  AppIcons.settings,
                  color: AppColors.surface,
                ),
                label: ''),
          ],
          selectedIndex: _currentTabIndex,
          onDestinationSelected: setCurrentTabIndex,
        ),
      ),
    );
  }
}
