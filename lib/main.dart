import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/app.dart';
import 'package:rick_and_morty_app/app/di/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}
