import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/domain/usecases/fetch_characters_usecase.dart';

class HomePageController extends ChangeNotifier {
  final FetchCharactersUsecase _fetchCharactersUsecase;

  HomePageController({required FetchCharactersUsecase fetchCharactersUsecase})
    : _fetchCharactersUsecase = fetchCharactersUsecase {
    _setupScrollController();
    _setupSearchController();
  }

  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  bool isLoading = false;
  List<CharacterEntity> _allCharacters = [];
  List<CharacterEntity> _filteredCharacters = [];
  String? nextPage;

  List<CharacterEntity> get characters => _filteredCharacters;

  void _setupScrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        if (!isLoading && nextPage != null) {
          fetchCharacters();
        }
      }
    });
  }

  void _setupSearchController() {
    searchController.addListener(_filterCharacters);
  }

  void _filterCharacters() {
    final searchTerm = searchController.text.toLowerCase();

    if (searchTerm.isEmpty) {
      _filteredCharacters = _allCharacters;
    } else {
      _filteredCharacters = _allCharacters
          .where(
            (character) => character.name.toLowerCase().contains(searchTerm),
          )
          .toList();
    }

    notifyListeners();
  }

  Future<void> fetchCharacters() async {
    if (isLoading) return;

    try {
      _setLoading(true);

      final result = await _fetchCharactersUsecase(nextPage);

      result.fold((failure) => null, (response) {
        if (nextPage == null) {
          _allCharacters = response.results;
        } else {
          _allCharacters.addAll(response.results);
        }

        nextPage = response.info.next;
        _filterCharacters();
      });
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
