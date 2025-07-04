import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/character_card_container.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/character_card_image.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/character_card_info.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;
  final void Function(CharacterEntity) onTap;

  const CharacterCard({
    super.key,
    required this.character,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(character),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, top: 60),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CharacterCardContainer(
              child: CharacterCardInfo(character: character),
            ),
            CharacterCardImage(imageUrl: character.image),
          ],
        ),
      ),
    );
  }
}
