import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({super.key});

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  var _currentTabIndex = 0;

  void setCurrentTabIndex(int value) {
    setState(() {
      _currentTabIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: IndexedStack(
        index: _currentTabIndex,
        children: const [
           ScrollableList(),
           Text('health', style: TextStyle(color: Colors.red)),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
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
        ],
        selectedIndex: _currentTabIndex,
        onDestinationSelected: setCurrentTabIndex,
      ),
    );
  }
}

class ScrollableList extends StatelessWidget {
  const ScrollableList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(30, (index) {
          return Container(
            height: 30,
            color: index%2==0 ? Colors.purple : Colors.grey,
          );
        }),
      ),
    );
  }
}
