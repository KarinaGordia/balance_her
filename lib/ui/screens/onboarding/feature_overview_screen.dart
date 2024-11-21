import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/resources/resources.dart';
import 'package:balance_her/ui/screens/onboarding/onboarding_screen.dart';
import 'package:balance_her/ui/screens/onboarding/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:balance_her/ui/theme/theme.dart';

class FeatureOverviewScreen extends StatelessWidget {
  const FeatureOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      imageName: Images.overviewStar,
      title: 'Feature overview',
      buttonLabel: 'Next',
      subtitle: const FeaturesWidget(),
      onButtonPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StartScreen(),
          ),
        );
      },
    );
  }
}

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FeatureRow(icon: AppIcons.checkbox_marked,
          iconColor: AppColors.blue,
          text: 'Task scheduling',),
        FeatureRow(icon: AppIcons.cards_heart,
          iconColor: AppColors.red,
          text: 'Health tracker',),
        FeatureRow(icon: AppIcons.book,
          iconColor: AppColors.violet,
          text: 'Habit tracking',),
      ],
    );
  }
}

class FeatureRow extends StatelessWidget {
  const FeatureRow(
      {super.key, required this.icon, required this.text, this.iconColor});

  final IconData icon;
  final Color? iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          textAlign: TextAlign.center,
          style: OnboardingTextStyles.subtitle,
        ),
      ],
    );
  }
}