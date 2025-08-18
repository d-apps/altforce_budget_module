import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/pages/detail/presentation/product_detail_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/fields/app_select_field.dart';
import 'enums/color_enum.dart';
import 'enums/finish_enum.dart';
import 'enums/warranty_enum.dart';

class ResidentialForm extends StatefulWidget {
  final ProductDetailController controller;
  const ResidentialForm({
    required this.controller,
    super.key
  });

  @override
  State<ResidentialForm> createState() => _ResidentialFormState();
}

class _ResidentialFormState extends State<ResidentialForm> {

  ProductDetailController get controller => widget.controller;
  ColorEnum? color;
  WarrantyEnum? warranty;
  FinishEnum? finish;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        AppSelectField<ColorEnum>(
            label: "Cor",
            items: ColorEnum.values.toList(),
            selectedValue: color,
            onSelected: (v){
              controller.product.setAttribute(
                AttributeKeys.residential.color,
                v.toString(),
              );
              setState(() {
                color = v;
              });
            }
        ),
        AppSelectField<WarrantyEnum>(
          label: "Garantia",
          items: WarrantyEnum.values.toList(),
          selectedValue: warranty,
          onSelected: (v){
            controller.product.setAttribute(
              AttributeKeys.residential.warranty,
              v.toString(),
            );
            setState(() {
              warranty = v;
            });
          },
        ),
        AppSelectField<FinishEnum>(
          label: "Acabamento",
          items: FinishEnum.values.toList(),
          selectedValue: finish,
          onSelected: (v){
            controller.product.setAttribute(
              AttributeKeys.residential.finish,
              v.toString(),
            );
            setState(() {
              finish = v;
            });
          },
        )
      ],
    );
  }
}
