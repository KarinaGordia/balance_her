import 'package:balance_her/ui/screens/onboarding/onboarding_screen.dart';
import 'package:balance_her/ui/screens/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';

abstract class Screens {
  static const onboarding = "onboarding";
  static const main = "/";
  // static const sessionDetails = "/session_details";
}

class MainNavigation {
  final initialRoute = Screens.onboarding;

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    Screens.onboarding: (context) => const WelcomeScreen(),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}