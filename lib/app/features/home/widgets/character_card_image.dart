import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class CharacterCardImage extends StatelessWidget {
  final String imageUrl;

  const CharacterCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.secondary,
            border: Border.all(color: Colors.transparent, width: 2),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.secondary),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: AppColors.tertiary),
            ),
          ),
        ),
      ),
    );
  }
}
