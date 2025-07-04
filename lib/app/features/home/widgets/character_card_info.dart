import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';

class CharacterCardInfo extends StatelessWidget {
  final CharacterEntity character;

  const CharacterCardInfo({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          character.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          character.species,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: 12),
        Text(
          character.location.name,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
