import 'package:rick_and_morty_app/app/core/consts/endpoints.dart';
import 'package:rick_and_morty_app/app/core/errors/exceptions.dart';
import 'package:rick_and_morty_app/app/core/http_client/http_client.dart';
import 'package:rick_and_morty_app/app/data/model/character_response_model.dart';

abstract class CharacterDatasource {
  Future<CharacterResponseModel> fetchCharacters({String? nextUrl});
}

class CharacterDatasourceImpl implements CharacterDatasource {
  final HttpClient _httpClient;

  CharacterDatasourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<CharacterResponseModel> fetchCharacters({String? nextUrl}) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: nextUrl ?? Endpoints.characters,
      );

      if (response.data == null) {
        throw UnexpectedException(
          message: 'Dados dos personagens não encontrados',
        );
      }

      return CharacterResponseModel.fromMap(response.data);
    } catch (e) {
      if (e is HttpException || e is UnexpectedException) {
        rethrow;
      }

      throw UnexpectedException(message: e.toString());
    }
  }
}
