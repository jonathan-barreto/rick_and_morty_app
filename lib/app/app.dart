import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_theme.dart';
import 'package:rick_and_morty_app/app/features/splash/page/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}