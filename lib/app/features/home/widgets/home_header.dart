import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/core/consts/assets.dart';
import 'package:rick_and_morty_app/app/features/home/widgets/home_search_field.dart';

class HomeHeader extends StatelessWidget {
  final TextEditingController searchController;

  const HomeHeader({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        SvgPicture.asset(Assets.logo, width: 300),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: HomeSearchField(controller: searchController),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
