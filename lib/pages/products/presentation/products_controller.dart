import 'package:altforce_budget_module/core/result/result.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/repositories/i_repository.dart';
import 'package:get/get.dart';

import '../../../models/products/industrial_product.dart';
import '../enums/category_enum.dart';

class ProductsController extends GetxController {
  final IRepository<Product> _repository;

  ProductsController({
    required IRepository<Product> repository,
  }) : _repository = repository;

  @override
  void onReady() {
    getProducts();
    super.onReady();
  }

  final isLoading = false.obs;
  final _productsSourceList = <Product>[];
  final products = <Product>[].obs;
  final category = CategoryEnum.industrial.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  Future<void> getProducts() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    final result = await _repository.getAll();
    switch(result){
      case Success<List<Product>>():
        final fetchedProducts = result.data;
        _productsSourceList.assignAll(fetchedProducts);
        onCategorySelected(category.value);
        setLoading(false);
      case Failure<List<Product>>():
        setLoading(false);
    }

  }

  void onCategorySelected(CategoryEnum category) {
    this.category.value = category;
    this.category.refresh();
    filterProductList();
  }

  void filterProductList(){
    late List<Product> list;
    switch(category.value){
      case CategoryEnum.industrial:
        list = _productsSourceList
            .whereType<IndustrialProduct>().toList();
      case CategoryEnum.residental:
        list = _productsSourceList
            .whereType<ResidentialProduct>().toList();
      case CategoryEnum.corporate:
        list = _productsSourceList
            .whereType<CorporateProduct>().toList();
    }
    products.assignAll(list);
  }

}