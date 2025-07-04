import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rick_and_morty_app/app/core/consts/endpoints.dart';
import 'package:rick_and_morty_app/app/core/errors/exceptions.dart';
import 'package:rick_and_morty_app/app/core/http_client/http_client.dart';
import 'package:rick_and_morty_app/app/data/datasource/character_datasource.dart';
import 'package:rick_and_morty_app/app/data/model/character_model.dart';
import 'package:rick_and_morty_app/app/data/model/character_response_model.dart';
import 'package:rick_and_morty_app/app/data/model/info_model.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late CharacterDatasource datasource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = CharacterDatasourceImpl(httpClient: mockHttpClient);
    registerFallbackValue(Uri.parse(''));
  });

  group('fetchCharacters', () {
    final tCharacterResponseModel = CharacterResponseModel(
      info: InfoModel(count: 1, pages: 1, next: 'next_url', prev: 'prev_url'),
      results: [
        CharacterModel(
          id: 1,
          name: 'Rick',
          status: 'Alive',
          species: 'Human',
          type: '',
          gender: 'Male',
          origin: null,
          location: null,
          image: 'image_url',
          episode: ['episode1'],
          url: 'character_url',
          created: '2023-01-01',
        ),
      ],
    );

    final tSuccessResponse = HttpResponse(
      data: {
        'info': {
          'count': 1,
          'pages': 1,
          'next': 'next_url',
          'prev': 'prev_url',
        },
        'results': [
          {
            'id': 1,
            'name': 'Rick',
            'status': 'Alive',
            'species': 'Human',
            'type': '',
            'gender': 'Male',
            'origin': null,
            'location': null,
            'image': 'image_url',
            'episode': ['episode1'],
            'url': 'character_url',
            'created': '2023-01-01',
          },
        ],
      },
    );

    test(
      'deve retornar CharacterResponseModel quando a chamada for bem sucedida',
      () async {
        // Arrange
        when(
          () => mockHttpClient.get(endpoint: Endpoints.characters),
        ).thenAnswer((_) async => tSuccessResponse);

        // Act
        final result = await datasource.fetchCharacters();

        // Assert
        expect(result, isA<CharacterResponseModel>());
        expect(result.info?.next, equals(tCharacterResponseModel.info?.next));
        expect(
          result.results?.length,
          equals(tCharacterResponseModel.results?.length),
        );
        verify(
          () => mockHttpClient.get(endpoint: Endpoints.characters),
        ).called(1);
      },
    );

    test(
      'deve retornar CharacterResponseModel quando a chamada com nextUrl for bem sucedida',
      () async {
        // Arrange
        const nextUrl = 'https://rickandmortyapi.com/api/character?page=2';
        when(
          () => mockHttpClient.get(endpoint: nextUrl),
        ).thenAnswer((_) async => tSuccessResponse);

        // Act
        final result = await datasource.fetchCharacters(nextUrl: nextUrl);

        // Assert
        expect(result, isA<CharacterResponseModel>());
        expect(result.info?.next, equals(tCharacterResponseModel.info?.next));
        expect(
          result.results?.length,
          equals(tCharacterResponseModel.results?.length),
        );
        verify(() => mockHttpClient.get(endpoint: nextUrl)).called(1);
      },
    );

    test(
      'deve lançar UnexpectedException quando a resposta não contiver dados',
      () async {
        // Arrange
        when(
          () => mockHttpClient.get(endpoint: Endpoints.characters),
        ).thenAnswer((_) async => HttpResponse(data: null));

        // Act
        final call = datasource.fetchCharacters;

        // Assert
        expect(
          () => call(),
          throwsA(
            isA<UnexpectedException>().having(
              (e) => e.message,
              'message',
              'Dados dos personagens não encontrados',
            ),
          ),
        );
      },
    );

    test(
      'deve lançar HttpException quando ocorrer um erro na chamada HTTP',
      () async {
        // Arrange
        when(
          () => mockHttpClient.get(endpoint: Endpoints.characters),
        ).thenThrow(
          HttpException(
            type: HttpExceptionType.connection,
            message: 'Erro na chamada HTTP',
          ),
        );

        // Act
        final call = datasource.fetchCharacters;

        // Assert
        expect(() => call(), throwsA(isA<HttpException>()));
      },
    );

    test(
      'deve lançar UnexpectedException quando ocorrer um erro desconhecido',
      () async {
        // Arrange
        when(
          () => mockHttpClient.get(endpoint: Endpoints.characters),
        ).thenThrow(Exception('Erro desconhecido'));

        // Act
        final call = datasource.fetchCharacters;

        // Assert
        expect(
          () => call(),
          throwsA(
            isA<UnexpectedException>().having(
              (e) => e.message,
              'message',
              'Exception: Erro desconhecido',
            ),
          ),
        );
      },
    );
  });
}
