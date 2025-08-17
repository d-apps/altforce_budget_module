import 'package:altforce_budget_module/core/result/result.dart';
import 'package:altforce_budget_module/models/products/corporate_product.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/models/products/residential_product.dart';
import 'package:altforce_budget_module/repositories/i_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../models/products/industrial_product.dart';
import 'enums/category_enum.dart';

class QuoteController extends ChangeNotifier {
  final IRepository<Product> _repository;

  QuoteController({
    required IRepository<Product> repository,
  }) : _repository = repository ;

  bool isLoading = false;
  final _productsSourceList = <Product>[];
  final products = <Product>[];
  CategoryEnum category = CategoryEnum.industrial;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getProducts() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    products.clear();
    final result = await _repository.getAll();
    switch(result){
      case Success<List<Product>>():
        final fetchedProducts = result.data;
        _productsSourceList.addAll(fetchedProducts);
        onCategorySelected(category);
        setLoading(false);
      case Failure<List<Product>>():
        setLoading(false);
    }

  }

  void onCategorySelected(CategoryEnum category) {
    this.category = category;
    late List<Product> list;
    switch(category){
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
    products
      ..clear()
      ..addAll(list);
        notifyListeners();
  }
}