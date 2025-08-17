import 'package:altforce_budget_module/view/quote/quote_page.dart';
import 'package:flutter/material.dart';

import 'core/design/app_theme_data.dart';

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
      theme: AppThemeData.theme,
      home: const HomeView(),
    );
  }
}

