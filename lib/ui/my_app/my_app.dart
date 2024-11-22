import 'package:balance_her/ui/navigation/main_navigation.dart';
import 'package:balance_her/ui/screens/onboarding/feature_overview_screen.dart';
import 'package:balance_her/ui/screens/onboarding/start_screen.dart';
import 'package:balance_her/ui/screens/onboarding/welcome_screen.dart';
import 'package:balance_her/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BalanceHer',
      theme: AppTheme.light,
      initialRoute: mainNavigation.initialRoute,
      routes: mainNavigation.routes,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      // home: const WelcomeScreen(),
    );
  }
}
