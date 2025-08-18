import 'package:altforce_budget_module/models/fields/app_number_field.dart';
import 'package:altforce_budget_module/pages/budget/widgets/budget_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'budget_controller.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final controller = Get.find<BudgetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orçamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                    imageUrl: controller.product.image,
                    width: 100,
                    height: 80
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(
                    controller.product.name,
                    style: TextStyle(fontSize: 16),
                ))
              ],
            ),
            ...controller.product.attributes.map((key, value) {
              return MapEntry(key, BudgetText(label: key, text: value.toString()));
            }).values,
            AppNumberField(
                initialValue: "1",
                label: "Quantidade",
                onChanged: (v){
                  controller.product.quantity = int.tryParse(v!) ?? 1;
                  setState(() {});
                }
            ),
            BudgetText(
                label: "Valor",
                text: "R\$ ${controller.product.price}"
            ),
            BudgetText(
                label: "Total",
                text: "R\$ ${controller.product.price * controller.product.quantity}"
            )
          ],
        ),
      ),
    );
  }
}
