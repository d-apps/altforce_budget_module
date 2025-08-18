import 'package:altforce_budget_module/core/route/app_routes.dart';
import 'package:altforce_budget_module/pages/detail/models/product_detail_arguments_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../models/products/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final int index;

  const ProductTile({
    required this.product,
    required this.index,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigate(context),
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Hero(
                  tag: index,
                  child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text("R\$ ${product.price}", style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),),
                    TextButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Ver produto", style: TextStyle(color: Colors.white,fontSize: 12),),
                          const SizedBox(width: 4),
                          Icon(FontAwesomeIcons.locationArrow, color: Colors.white, size: 15,)
                        ],
                      ),
                      onPressed: () => navigate(context),
                    ),
                  ],
                ),
              )
              //const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context){
      Get.toNamed(
          AppRoutes.productsDetail.name,
          arguments: ProductDetailArgumentsModel(product: product, index: index)
      );
  }

}
