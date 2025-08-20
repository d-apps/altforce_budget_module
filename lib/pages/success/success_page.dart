import 'package:altforce_budget_module/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatelessWidget {
  final String title;

  const SuccessPage({
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/success_check.json',
              height: Get.height * 0.20,
              width: Get.width * 0.40,
            ),
            Text(
              title,
              style: TextStyle()
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: (){
                Get.until((route) => route.settings.name == AppRoutes.products.name);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Theme.of(context).primaryColor)
                  )
                ),
                padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            ),
              child: Text(
                  "Voltar ao início",
                  style: TextStyle(color: Theme.of(context).primaryColor))
              ),
          ],
        ),
      ),
    );
  }
}
