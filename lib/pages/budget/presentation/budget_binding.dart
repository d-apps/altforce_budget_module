import 'package:altforce_budget_module/pages/budget/presentation/budget_controller.dart';
import 'package:altforce_budget_module/services/rule_engine.dart';
import 'package:get/get.dart';

import '../../../models/strategies/validation/validation_strategy_factory.dart';

class BudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IValidationStrategyFactory>(ValidationStrategyFactory());
    Get.put<IRuleEngine>(RuleEngine());
    Get.put(BudgetController(
      ruleEngine: Get.find()
    ));
  }
}