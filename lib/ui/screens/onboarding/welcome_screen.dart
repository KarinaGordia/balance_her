import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:balance_her/ui/theme/theme.dart';

import 'feature_overview_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  
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
              Image.asset(Images.welcomeSquare),
              const SizedBox(height: 64,),
              const Text(
                'Welcome to BalanceHer!',
                textAlign: TextAlign.center,
                style: OnboardingTextStyles.title,
              ),
              const SizedBox(height: 16,),
              const Text(
                'Your assistant in creating\nharmony and development!',
                textAlign: TextAlign.center,
                style: OnboardingTextStyles.subtitle,
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeatureOverviewScreen()),);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Next',
                      style: OnboardingTextStyles.buttonText,
                    ),
                    Icon(AppIcons.arrow_right, color: AppColors.onSecondary,),
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
