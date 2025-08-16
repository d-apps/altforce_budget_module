import 'package:altforce_budget_module/view/quote_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AltForce Budget Module',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            minimumSize: const Size(0, 30),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.green,
        )
      ),
      home: const HomeView(),
    );
  }
}

