import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/ui/screens/main_tabs_screen/main_tabs_view_model.dart';
import 'package:balance_her/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context
        .select<MainTabsViewModel, int>((value) => value.currentTabIndex);
    final model = context.read<MainTabsViewModel>();
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Text('main', style: TextStyle(color: Colors.red)),
          Text('health', style: TextStyle(color: Colors.red)),
          Text('habits', style: TextStyle(color: Colors.red)),
          Text('settings', style: TextStyle(color: Colors.red)),
        ],
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 32.0, right: 32,),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(icon: Icon(AppIcons.home), label: ''),
            NavigationDestination(icon: Icon(AppIcons.cards_heart), label: ''),
            NavigationDestination(icon: Icon(AppIcons.run), label: ''),
            NavigationDestination(icon: Icon(AppIcons.settings), label: ''),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: model.setCurrentTabIndex,
        ),
      ),
    );
  }
}
