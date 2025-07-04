import 'package:rick_and_morty_app/app/core/either/either.dart';
import 'package:rick_and_morty_app/app/core/errors/failures.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_response_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterResponseEntity>> fetchCharacters(
    String? nextUrl,
  );
}
