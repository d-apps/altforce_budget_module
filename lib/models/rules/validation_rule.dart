import 'package:altforce_budget_module/models/rules/i_business_rule.dart';
import 'package:altforce_budget_module/models/strategies/i_rule_strategy.dart';
import 'package:altforce_budget_module/models/strategies/validation/validation_strategy_factory.dart';
import 'package:get/get.dart';
import '../../pages/budget/models/cart_model.dart';

class ValidationRule implements IBusinessRule<Rx<CartModel>> {
  final IValidationStrategyFactory validationStrategyFactory;

  ValidationRule({
    required this.validationStrategyFactory,
  });

  @override
  bool evaluate(Rx<CartModel> cart) {
    final IRuleStrategy strategy = validationStrategyFactory
        .create(cart.value.product!);
    return strategy.validate(cart.value.product!);
  }

  @override
  int get priority => 1;

  @override
  void execute(Rx<CartModel> cart) {}

}