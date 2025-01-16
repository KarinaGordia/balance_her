import 'package:balance_her/ui/screens/darfy.dart';
import 'package:balance_her/ui/screens/main_tabs_screen/main_tabs_view_model.dart';
import 'package:balance_her/ui/screens/main_tabs_screen/main_tabs_screen.dart';
import 'package:balance_her/ui/screens/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class Screens {
  static const onboarding = "onboarding";
  static const mainTabs = "/";
}

class MainNavigation {
  // final initialRoute = Screens.onboarding;
  final initialRoute = Screens.mainTabs;

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    Screens.onboarding: (context) => const WelcomeScreen(),
    Screens.mainTabs: (context) => Provider(
      create: (_) => MainTabsViewModel(),
      child: const MainTabsScreen(),
    ),
    // Screens.mainTabs: (context) => const DraftScreen(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}