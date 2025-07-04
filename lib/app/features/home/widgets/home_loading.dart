import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.tertiary),
    );
  }
}
