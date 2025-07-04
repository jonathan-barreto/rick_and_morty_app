import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';
import 'package:rick_and_morty_app/app/domain/entities/character_entity.dart';
import 'package:rick_and_morty_app/app/features/character/page/character_page.dart';
import 'package:rick_and_morty_app/app/features/home/controller/home_page_controller.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/home_character_list.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/home_header.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/home_loading.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/home_title.dart';
import 'package:rick_and_morty_app/app/di/di.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = getIt<HomePageController>();

  @override
  void initState() {
    super.initState();
    _controller.fetchCharacters();
  }

  @override
  void dispose() {
    _controller.searchController.dispose();
    super.dispose();
  }

  void _onCharacterTap(CharacterEntity character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterPage(character: character),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          if (_controller.isLoading && _controller.characters.isEmpty) {
            return const HomeLoading();
          }

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                controller: _controller.scrollController,
                child: Column(
                  children: [
                    HomeHeader(searchController: _controller.searchController),
                    const HomeTitle(),
                    HomeCharacterList(
                      characters: _controller.characters,
                      onCharacterTap: _onCharacterTap,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
