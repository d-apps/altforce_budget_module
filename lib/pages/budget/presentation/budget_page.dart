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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantidade:"),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        controller.product
                            .decrementQuantity();
                        setState(() {});
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(controller.product.quantity
                        .toString()),
                    IconButton(
                      onPressed: (){
                        controller.product
                            .incrementQuantity();
                        setState(() {});
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
