import 'dart:convert';
import 'package:rick_and_morty_app/app/data/model/character_model.dart';
import 'package:rick_and_morty_app/app/data/model/info_model.dart';

class CharacterResponseModel {
  final InfoModel? info;
  final List<CharacterModel>? results;

  CharacterResponseModel({this.info, this.results});

  factory CharacterResponseModel.fromMap(Map<String, dynamic> map) {
    return CharacterResponseModel(
      info: map['info'] != null ? InfoModel.fromMap(map['info']) : null,
      results: map['results'] != null
          ? List<CharacterModel>.from(
              map['results'].map((x) => CharacterModel.fromMap(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'info': info?.toMap(),
      'results': results?.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
