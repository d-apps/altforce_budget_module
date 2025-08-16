
import '../../../models/rules/business_rule.dart';

abstract class IPriorityManager {
  List<BusinessRule> sortRules(List<BusinessRule> rules);
}