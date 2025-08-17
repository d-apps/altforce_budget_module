import 'package:altforce_budget_module/core/result/result.dart';
import 'package:altforce_budget_module/models/base_model.dart';

abstract class IRepository<T extends BaseModel> {
  Future<Result<List<T>>> getAll();
}