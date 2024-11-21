import 'package:balance_her/app_icons_icons.dart';
import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key,
    required this.imageName,
    required this.title,
    this.subtitle,
    required this.buttonLabel,
    required this.onButtonPressed
  });

  final String imageName;
  final String title;
  final Widget? subtitle;
  final String buttonLabel;
  final Function()? onButtonPressed;

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
                Image.asset(imageName),
                const SizedBox(height: 64,),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: OnboardingTextStyles.title,
                ),
                const SizedBox(height: 16,),
                if(subtitle != null)
                  subtitle!,
              ],
            ),
            Positioned(
              bottom: 48,
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                  fixedSize: WidgetStatePropertyAll(Size(200, 56)),
                ),
                onPressed: onButtonPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      buttonLabel,
                      style: OnboardingTextStyles.buttonText,
                    ),
                    const Icon(AppIcons.arrow_right, color: AppColors.onSecondary,),
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
