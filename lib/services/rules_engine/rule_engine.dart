import 'package:altforce_budget_module/core/mixins/priority_manager_mixin.dart';
import 'package:altforce_budget_module/models/rules/quantity_discount_rule.dart';
import 'package:altforce_budget_module/models/rules/sla_tax_rule.dart';
import 'package:altforce_budget_module/models/rules/validation_rule.dart';
import 'package:altforce_budget_module/pages/budget/models/cart_model.dart';
import 'package:get/get.dart';
import '../../models/rules/i_business_rule.dart';

abstract class IRuleEngine<T> {
  void process(T context);
}

class RuleEngine with PriorityManagerMixin implements IRuleEngine<Rx<CartModel>>  {
  List<IBusinessRule> rules = [
    ValidationRule(validationStrategyFactory: Get.find()),
    QuantityDiscountRule(),
    SlaTaxRule()
  ];


  @override
  void process(Rx<CartModel> cart) {
    rules = sortRules(rules);
    for (var rule in rules) {
      if (rule.evaluate(cart)) {
        print(cart.value.quantity);
        print(cart.value.totalPrice);
        rule.execute(cart);
      }
    }
  }

}