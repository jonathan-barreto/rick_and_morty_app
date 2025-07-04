import 'package:rick_and_morty_app/app/core/either/either.dart';
import 'package:rick_and_morty_app/app/core/errors/failures.dart';
import 'package:rick_and_morty_app/app/data/datasource/character_datasource.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_response_entity.dart';
import 'package:rick_and_morty_app/app/domain/mappers/character_mapper.dart';
import 'package:rick_and_morty_app/app/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource _datasource;

  CharacterRepositoryImpl({required CharacterDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Either<Failure, CharacterResponseEntity>> fetchCharacters(
    String? nextUrl,
  ) async {
    try {
      final response = await _datasource.fetchCharacters(nextUrl: nextUrl);
      return Right(CharacterMapper.toResponseEntity(response));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
