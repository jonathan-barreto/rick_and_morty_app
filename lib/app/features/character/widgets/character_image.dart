import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;

  const CharacterImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(color: AppColors.tertiary),
        ),
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, color: AppColors.tertiary, size: 50),
      ),
    );
  }
}
