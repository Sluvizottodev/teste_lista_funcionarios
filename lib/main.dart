// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_pratico_mobile/provider/employee_provider.dart';
import 'package:teste_pratico_mobile/view/home_screen.dart';
import 'package:teste_pratico_mobile/utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()..loadEmployees()),
      ],
      child: const MyApp(),
    ),
  );
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
