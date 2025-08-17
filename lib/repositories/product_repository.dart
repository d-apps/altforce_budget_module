import 'package:altforce_budget_module/models/products/product.dart';
import 'package:altforce_budget_module/repositories/fake_products.dart';
import 'package:altforce_budget_module/repositories/i_repository.dart';
import '../core/result/result.dart';

class ProductRepository implements IRepository<Product> {

  @override
  Future<Result<List<Product>>> getAll() async {
    try {
      final products = <Product>[
        ...List.generate(5, (_) => fakeIndustrialProduct),
        ...List.generate(5, (_) => fakeResidentialProduct),
        ...List.generate(5, (_) => fakeCorporateProduct),
      ];
      return Result.success(products);
    } catch(e){
      return Result.failure(e.toString());
    }
  }

}
