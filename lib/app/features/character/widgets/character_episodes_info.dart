import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/character_info_row.dart';
import 'package:rick_and_morty_app/app/features/character/widgets/info_card.dart';

class CharacterEpisodesInfo extends StatelessWidget {
  final CharacterEntity character;

  const CharacterEpisodesInfo({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return InfoCard(
      child: CharacterInfoRow(
        icon: Icons.tv,
        label: 'Episódios',
        value: '${character.episode.length} episódio(s)',
        labelColor: AppColors.tertiary,
      ),
    );
  }
}
