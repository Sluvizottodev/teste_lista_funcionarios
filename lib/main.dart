// lib/main.dart
import 'package:flutter/material.dart';
import 'package:teste_pratico_mobile/view/home_screen.dart';
import 'package:teste_pratico_mobile/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Talent',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
