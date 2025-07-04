import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/app/core/consts/endpoints.dart';
import 'package:rick_and_morty_app/app/core/http_client/http_client.dart';
import 'package:rick_and_morty_app/app/core/http_client/http_client_impl.dart';
import 'package:rick_and_morty_app/app/data/datasource/character_datasource.dart';
import 'package:rick_and_morty_app/app/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty_app/app/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/app/domain/usecases/fetch_characters_usecase.dart';
import 'package:rick_and_morty_app/app/features/home/controller/home_page_controller.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory<Dio>(
    () => Dio(BaseOptions(baseUrl: Endpoints.baseUrl)),
  );

  getIt.registerFactory<HttpClient>(() => HttpClientImpl(dio: getIt()));

  // Data sources
  await _registerDataSources();

  // Repositories
  await _registerRepositories();

  // Usecases
  await _registerUsecases();

  // Controllers
  await _registerControllers();
}

Future<void> _registerDataSources() async {
  getIt.registerFactory<CharacterDatasource>(
    () => CharacterDatasourceImpl(httpClient: getIt()),
  );
}

Future<void> _registerRepositories() async {
  getIt.registerFactory<CharacterRepository>(
    () => CharacterRepositoryImpl(datasource: getIt()),
  );
}

Future<void> _registerUsecases() async {
  getIt.registerFactory<FetchCharactersUsecase>(
    () => FetchCharactersUsecase(repository: getIt()),
  );
}

Future<void> _registerControllers() async {
  getIt.registerFactory(
    () => HomePageController(
      fetchCharactersUsecase: getIt<FetchCharactersUsecase>(),
    ),
  );
}
