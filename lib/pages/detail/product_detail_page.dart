import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:altforce_budget_module/pages/detail/product_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/products/product.dart';

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
                controller.dynamicFormFactory.makeDynamicFormWidget(controller),
                Text(
                  "R\$ ${controller.product.basePrice * controller.product.quantity}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Quantidade:"),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            controller.product.decrementQuantity();
                            setState(() {});
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(controller.product.quantity.toString()),
                        IconButton(
                          onPressed: (){
                            controller.product.incrementQuantity();
                            setState(() {});
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: (){
                      print(controller.product);
                    },
                    child: Text("Realizar orçamento".toUpperCase(),
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
