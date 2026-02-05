import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/movies_screen.dart';

void main() {
  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainMoviesScreen());
  }
}
