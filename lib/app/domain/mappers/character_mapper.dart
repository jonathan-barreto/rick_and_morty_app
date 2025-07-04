import 'package:rick_and_morty_app/app/data/model/character_model.dart';
import 'package:rick_and_morty_app/app/data/model/character_response_model.dart';
import 'package:rick_and_morty_app/app/data/model/info_model.dart';
import 'package:rick_and_morty_app/app/data/model/location_model.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_response_entity.dart';
import 'package:rick_and_morty_app/app/domain/entities/info_entity.dart';
import 'package:rick_and_morty_app/app/domain/entities/location_entity.dart';

class CharacterMapper {
  static CharacterResponseEntity toResponseEntity(
    CharacterResponseModel model,
  ) {
    return CharacterResponseEntity(
      info: _infoToEntity(model.info),
      results: model.results?.map((x) => toEntity(x)).toList() ?? [],
    );
  }

  static InfoEntity _infoToEntity(InfoModel? model) {
    return InfoEntity(
      count: model?.count ?? 0,
      pages: model?.pages ?? 0,
      next: model?.next,
      prev: model?.prev,
    );
  }

  static CharacterEntity toEntity(CharacterModel model) {
    return CharacterEntity(
      id: model.id ?? 0,
      name: model.name ?? '',
      status: model.status ?? '',
      species: model.species ?? '',
      type: model.type ?? '',
      gender: model.gender ?? '',
      origin: _locationToEntity(model.origin),
      location: _locationToEntity(model.location),
      image: model.image ?? '',
      episode: model.episode ?? [],
      url: model.url ?? '',
      created: model.created != null
          ? DateTime.parse(model.created!)
          : DateTime.now(),
    );
  }

  static LocationEntity _locationToEntity(LocationModel? model) {
    return LocationEntity(name: model?.name ?? '', url: model?.url ?? '');
  }

  static CharacterResponseModel toResponseModel(
    CharacterResponseEntity entity,
  ) {
    return CharacterResponseModel(
      info: _infoToModel(entity.info),
      results: entity.results.map((x) => toModel(x)).toList(),
    );
  }

  static InfoModel _infoToModel(InfoEntity entity) {
    return InfoModel(
      count: entity.count,
      pages: entity.pages,
      next: entity.next,
      prev: entity.prev,
    );
  }

  static CharacterModel toModel(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      origin: _locationToModel(entity.origin),
      location: _locationToModel(entity.location),
      image: entity.image,
      episode: entity.episode,
      url: entity.url,
      created: entity.created.toIso8601String(),
    );
  }

  static LocationModel _locationToModel(LocationEntity entity) {
    return LocationModel(name: entity.name, url: entity.url);
  }
}
