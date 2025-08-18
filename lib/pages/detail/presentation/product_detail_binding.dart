import 'package:altforce_budget_module/pages/detail/presentation/product_detail_controller.dart';
import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/dynamic_form_factory.dart';
import 'package:get/get.dart';

class ProductDetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<IDynamicFormFactory>(DynamicFormFactory());
    Get.put(ProductDetailController(
        dynamicFormFactory: Get.find()
    ));
  }

}