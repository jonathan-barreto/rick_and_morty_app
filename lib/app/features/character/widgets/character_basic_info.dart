import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_info_row.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/info_card.dart';

class CharacterBasicInfo extends StatelessWidget {
  final CharacterEntity character;

  const CharacterBasicInfo({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: Column(
        children: [
          CharacterInfoRow(
            icon: Icons.person,
            label: 'Nome',
            value: character.name,
            labelColor: AppColors.tertiary,
          ),
          const Divider(color: AppColors.primary, height: 32),
          CharacterInfoRow(
            icon: Icons.favorite,
            label: 'Status',
            value: character.status,
            valueColor: character.getStatusColor(),
            labelColor: AppColors.tertiary,
          ),
          const Divider(color: AppColors.primary, height: 32),
          CharacterInfoRow(
            icon: Icons.category,
            label: 'Espécie',
            value: character.species,
            labelColor: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}
