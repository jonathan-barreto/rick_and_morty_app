import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Text('Personagens', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(width: 16),
          const Expanded(
            child: Divider(thickness: 2, color: AppColors.tertiary),
          ),
        ],
      ),
    );
  }
}
