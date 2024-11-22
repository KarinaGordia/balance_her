import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/resources/resources.dart';
import 'package:balance_her/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:balance_her/ui/theme/theme.dart';

import 'feature_overview_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      imageName: Images.welcomeSquare,
      title: 'Welcome to BalanceHer!',
      buttonLabel: 'Next',
      subtitle: const Text(
        'Your assistant in creating\nharmony and development!',
        textAlign: TextAlign.center,
        style: OnboardingTextStyles.subtitle,
      ),
      onButtonPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const FeatureOverviewScreen(),
          ),
        );
      },
    );
  }
}
