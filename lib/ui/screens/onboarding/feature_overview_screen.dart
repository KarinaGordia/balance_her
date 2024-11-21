import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/resources/resources.dart';
import 'package:balance_her/ui/screens/onboarding/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:balance_her/ui/theme/theme.dart';

class FeatureOverviewScreen extends StatelessWidget {
  const FeatureOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Images.overviewStar),
                const SizedBox(height: 64),
                const Text(
                  'Feature overview',
                  textAlign: TextAlign.center,
                  style: OnboardingTextStyles.title,
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AppIcons.checkbox_marked,
                      color: AppColors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Task scheduling',
                      textAlign: TextAlign.center,
                      style: OnboardingTextStyles.subtitle,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AppIcons.cards_heart,
                      color: AppColors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Health tracker',
                      textAlign: TextAlign.center,
                      style: OnboardingTextStyles.subtitle,
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      AppIcons.book,
                      color: AppColors.violet,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Habit tracking',
                      textAlign: TextAlign.center,
                      style: OnboardingTextStyles.subtitle,
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 48,
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                  fixedSize: WidgetStatePropertyAll(Size(200, 56)),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StartScreen()),);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Next',
                      style: OnboardingTextStyles.buttonText,
                    ),
                    Icon(
                      AppIcons.arrow_right,
                      color: AppColors.onSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
