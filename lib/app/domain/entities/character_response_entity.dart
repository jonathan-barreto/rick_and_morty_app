import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/domain/entities/info_entity.dart';

class CharacterResponseEntity {
  final InfoEntity info;
  final List<CharacterEntity> results;

  const CharacterResponseEntity({required this.info, required this.results});
}
