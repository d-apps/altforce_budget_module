import 'package:altforce_budget_module/pages/budget/presentation/budget_controller.dart';
import 'package:get/get.dart';

class BudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BudgetController(

    ));
  }
}