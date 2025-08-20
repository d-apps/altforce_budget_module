import 'package:altforce_budget_module/core/extensions/string_extension.dart';
import 'package:altforce_budget_module/core/widgets/app_elevated_button.dart';
import 'package:altforce_budget_module/models/fields/app_number_field.dart';
import 'package:altforce_budget_module/pages/budget/presentation/widgets/budget_text.dart';
import 'package:altforce_budget_module/pages/success/success_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'budget_controller.dart';

class BudgetPage extends GetView<BudgetController> {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.cart.value.product!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orçamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          spacing: 8,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                    imageUrl: product.image,
                    width: 100,
                    height: 80
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(
                      product.name,
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
            ...product.attributes.map((key, value) {
              return MapEntry(
                  key,
                  BudgetText(label: "${key.tr}:", text: value.toString()
                )
              );
            }).values,
            const SizedBox(height: 8),
            AppNumberField(
              controller: controller.quantityController.value,
              label: "Quantidade",
            ),
            BudgetText(
                label: "Valor:",
                text: product.price.formatCurrency()
            ),
            Obx(() => BudgetText(
                label: "Desconto:",
                text: controller.cart.value.discount
            )),
            Obx(() => BudgetText(
                label: "Valor adicional:",
                text: controller.cart.value.additionalCharge
            )),
            const SizedBox(height: 16),
            Obx(() => BudgetText(
              label: "Total:",
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              text: controller.cart.value.totalPrice.formatCurrency(),
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
            const SizedBox(height: 8),
            Obx(() => AppElevatedButton(
                onPressed: controller.quantityController.value.text.isNotEmpty ? (){
                  Get.to(() => const SuccessPage(
                      title: 'Orçamento realizado com sucesso!'
                  ));
                }: null,
                text: "Finalizar orçamento"
            ))
          ],
        ),
      ),
    );
  }
}
