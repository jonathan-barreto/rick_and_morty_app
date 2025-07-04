import 'dart:convert';
import 'package:rick_and_morty_app/app/data/model/location_model.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final LocationModel? origin;
  final LocationModel? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      status: map['status'],
      species: map['species'],
      type: map['type'],
      gender: map['gender'],
      origin: map['origin'] != null
          ? LocationModel.fromMap(map['origin'])
          : null,
      location: map['location'] != null
          ? LocationModel.fromMap(map['location'])
          : null,
      image: map['image'],
      episode: map['episode'] != null
          ? List<String>.from(map['episode'])
          : null,
      url: map['url'],
      created: map['created'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin?.toMap(),
      'location': location?.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  String toJson() => json.encode(toMap());
}
