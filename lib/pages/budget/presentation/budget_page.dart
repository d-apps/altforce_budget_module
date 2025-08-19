import 'package:altforce_budget_module/models/fields/app_number_field.dart';
import 'package:altforce_budget_module/pages/budget/presentation/widgets/budget_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'budget_controller.dart';

class BudgetPage extends GetView<BudgetController> {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orçamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Obx((){
          final product = controller.product.value!;
          return Column(
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
                  initialValue: "1",
                  label: "Quantidade",
                  onChanged: controller.setQuantity,
              ),
              BudgetText(
                  label: "Valor",
                  text: "R\$ ${product.price}"
              ),
              BudgetText(
                  label: "Total",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  text: "R\$ ${product.price * product.quantity}",
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          );
        }),
      ),
    );
  }
}
