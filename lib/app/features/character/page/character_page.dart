import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_basic_info.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_episodes_info.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_image.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_location_info.dart';

class CharacterPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          character.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.tertiary,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.tertiary),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CharacterImage(imageUrl: character.image),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CharacterBasicInfo(character: character),
                  const SizedBox(height: 16),
                  CharacterLocationInfo(character: character),
                  const SizedBox(height: 16),
                  CharacterEpisodesInfo(character: character),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
