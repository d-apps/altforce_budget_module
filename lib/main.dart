import 'package:altforce_budget_module/core/lang/translation_service.dart';
import 'package:altforce_budget_module/core/validators/attributes_validator.dart';
import 'package:altforce_budget_module/core/route/app_routes.dart';
import 'package:altforce_budget_module/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'core/design/app_theme_data.dart';
import 'core/managers/priority_manager.dart';

void main() {
  Animate.restartOnHotReload = true;
  Get.put<IToastService>(ToastService());
  Get.put<IAttributesValidator>(AttributesValidator());
  Get.put<IPriorityManager>(PriorityManager());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AltForce Budget Module',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.theme,
      getPages: AppRoutes.values.map((e) => e.page).toList(),
      initialRoute: AppRoutes.products.name,
      locale: const Locale('pt', 'BR'),
      translations: TranslationService(),
    );
  }

}

