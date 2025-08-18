import 'package:altforce_budget_module/core/route/app_routes.dart';
import 'package:altforce_budget_module/pages/detail/presentation/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Produto"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Hero(
                  tag: controller.index,
                  child: CachedNetworkImage(
                    imageUrl: controller.product.image,
                    height: MediaQuery.sizeOf(context).height * 0.35,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  controller.product.name,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                controller.dynamicFormFactory
                    .makeDynamicFormWidget(controller),
                Text(
                  "R\$ ${controller.product.price * controller.product.quantity}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => controller.onSendBudget(),
                    child: Text(
                        "Realizar orçamento".toUpperCase(),
                      style: TextStyle(color: Colors.white)
                    )
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
