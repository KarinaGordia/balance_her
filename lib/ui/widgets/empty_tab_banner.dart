import 'package:balance_her/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyTabBanner extends StatelessWidget {
  const EmptyTabBanner(
      {super.key, required this.imagePath, required this.message});

  final String imagePath;
  final String message;

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.170948718;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 11.5),
          child: SvgPicture.asset(
            imagePath,
            width: imageWidth,
            colorFilter:
            const ColorFilter.mode(AppColors.outline8, BlendMode.srcIn),
          ),
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: AppColors.onPrimary),
        ),
      ],
    );
  }
}