import 'package:altforce_budget_module/core/result/result.dart';
import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/repositories/i_repository.dart';
import 'package:altforce_budget_module/view/enums/category_enum.dart';
import 'package:flutter/cupertino.dart';

class QuoteController extends ChangeNotifier {
  final IRepository<Product> _repository;

  QuoteController({
    required IRepository<Product> repository,
  }) : _repository = repository ;

  bool isLoading = false;
  final products = <Product>[];

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    products.clear();
    final result = await _repository.getAll();
    switch(result){
      case Success<List<Product>>():
        final fetchedProducts = result.data;
        products.addAll(fetchedProducts);
        isLoading = false;
        notifyListeners();
      case Failure<List<Product>>():
        isLoading = false;
        notifyListeners();
    }

  }

  void onCategorySelect(CategoryEnum category) {

  }
}