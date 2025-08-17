import 'package:altforce_budget_module/view/detail/widgets/forms/product_form_factory.dart';
import 'package:flutter/material.dart';

import '../../models/products/product.dart';

class QuoteDetailPage extends StatelessWidget {
  final Product product;
  final int index;
  final ProductFormFactory productFormFactory;

  const QuoteDetailPage({
    required this.product,
    required this.index,
    required this.productFormFactory,
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
                tag: ValueKey(index),
                child: Image.network(
                  product.image,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                ),
              ),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              productFormFactory.createForm(
                  product
              ),
              Text(
                "R\$ ${product.basePrice}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: (){},
                  child: Text("COMPRAR", style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
