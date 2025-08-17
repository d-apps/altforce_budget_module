import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:altforce_budget_module/pages/detail/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/products/product.dart';

class ProductDetailPage extends GetView<ProductDetailController> {

  const ProductDetailPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Hero(
                tag: controller.index,
                child: CachedNetworkImage(
                  imageUrl: controller.product.image,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                ),
              ),
              Text(
                controller.product.name,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller.dynamicFormFactory.get(controller.product),
              Text(
                "R\$ ${controller.product.basePrice}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Realizar orçamento".toUpperCase(), style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
