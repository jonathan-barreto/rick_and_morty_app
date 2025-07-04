import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/character_card.dart';

class HomeCharacterList extends StatelessWidget {
  final List<CharacterEntity> characters;
  final void Function(CharacterEntity) onCharacterTap;

  const HomeCharacterList({
    super.key,
    required this.characters,
    required this.onCharacterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return CharacterCard(
            character: characters[index],
            onTap: onCharacterTap,
          );
        },
      ),
    );
  }
}
