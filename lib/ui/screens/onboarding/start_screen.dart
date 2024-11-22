import 'package:balance_her/resources/resources.dart';
import 'package:balance_her/ui/navigation/main_navigation.dart';
import 'package:balance_her/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      imageName: Images.startCircle,
      title: 'Start your journey to harmony today!',
      buttonLabel: 'Get started',
      onButtonPressed: () {
        Navigator.of(context).pushReplacementNamed(Screens.mainTabs);
      },
    );
  }
}
