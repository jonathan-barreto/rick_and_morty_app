import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/core/consts/assets.dart';

class LogoSplash extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const LogoSplash({
    super.key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: fadeAnimation.value,
      child: Transform.scale(
        scale: scaleAnimation.value,
        child: SizedBox(width: 350, child: SvgPicture.asset(Assets.logo)),
      ),
    );
  }
}
