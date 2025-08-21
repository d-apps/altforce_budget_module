import 'package:altforce_budget_module/models/rules/i_business_rule.dart';

abstract class IPriorityManager {
  List<IBusinessRule> sortRules(List<IBusinessRule> rules);
}

class PriorityManager implements IPriorityManager {

  @override
  List<IBusinessRule> sortRules(List<IBusinessRule> rules) {
    rules.sort((a, b) => a.priority.compareTo(b.priority));
    return rules;
  }

}