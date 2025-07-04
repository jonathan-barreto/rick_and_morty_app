import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_info_row.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/info_card.dart';

class CharacterLocationInfo extends StatelessWidget {
  final CharacterEntity character;

  const CharacterLocationInfo({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        children: [
          CharacterInfoRow(
            icon: Icons.wc,
            label: 'Gênero',
            value: character.gender,
            labelColor: AppColors.tertiary,
          ),
          const Divider(color: AppColors.primary, height: 32),
          CharacterInfoRow(
            icon: Icons.location_on,
            label: 'Origem',
            value: character.origin.name,
            labelColor: AppColors.tertiary,
          ),
          const Divider(color: AppColors.primary, height: 32),
          CharacterInfoRow(
            icon: Icons.place,
            label: 'Localização',
            value: character.location.name,
            labelColor: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}
