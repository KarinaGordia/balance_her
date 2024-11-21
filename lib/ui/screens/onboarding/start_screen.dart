import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:balance_her/ui/theme/theme.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
                Image.asset(Images.startCircle),
                const SizedBox(height: 64,),
                const Text(
                  'Start your journey to harmony today!',
                  textAlign: TextAlign.center,
                  style: OnboardingTextStyles.title,
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
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Get started',
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
