import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class CharacterCardContainer extends StatelessWidget {
  final Widget child;

  const CharacterCardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      padding: const EdgeInsets.fromLTRB(16, 100, 16, 24),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiary, width: 2),
      ),
      child: child,
    );
  }
}
