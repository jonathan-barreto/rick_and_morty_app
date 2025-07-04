import 'package:rick_and_morty_app/app/core/either/either.dart';
import 'package:rick_and_morty_app/app/core/errors/failures.dart';
import 'package:rick_and_morty_app/app/core/usecase/usecase.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_response_entity.dart';
import 'package:rick_and_morty_app/app/domain/repositories/character_repository.dart';

class FetchCharactersUsecase
    implements Usecase<CharacterResponseEntity, String?> {
  final CharacterRepository _repository;

  FetchCharactersUsecase({required CharacterRepository repository})
    : _repository = repository;

  @override
  Future<Either<Failure, CharacterResponseEntity>> call(String? params) {
    return _repository.fetchCharacters(params);
  }
}
