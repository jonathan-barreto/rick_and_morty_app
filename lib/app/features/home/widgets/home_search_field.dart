import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class HomeSearchField extends StatelessWidget {
  final TextEditingController controller;

  const HomeSearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        hintText: 'Encontre um personagem...',
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        filled: true,
        fillColor: AppColors.secondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(Icons.search, color: AppColors.tertiary),
      ),
      style: const TextStyle(color: AppColors.white),
    );
  }
}
