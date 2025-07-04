import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/location_entity.dart';

class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationEntity origin;
  final LocationEntity location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  
  Color getStatusColor() {
    switch (status.toLowerCase()) {
      case 'alive':
        return AppColors.tertiary;
      case 'dead':
        return AppColors.red;
      default:
        return AppColors.secondary;
    }
  }
} 