import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/corporate/enums/corporate_contract_enum.dart';
import 'package:altforce_budget_module/pages/detail/widgets/dynamic_form_widget/corporate/enums/corporate_sla_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/fields/app_decimal_field.dart';
import '../../../../../models/fields/app_number_field.dart';
import '../../../../../models/fields/app_select_field.dart';
import '../../../presentation/product_detail_controller.dart';

class CorporateForm extends StatefulWidget {
  final ProductDetailController controller;

  const CorporateForm({
    required this.controller,
    super.key
  });

  @override
  State<CorporateForm> createState() => _CorporateFormState();
}

class _CorporateFormState extends State<CorporateForm> {

  ProductDetailController get controller => widget.controller;
  CorporateContractEnum? contract;
  CorporateSlaEnum? sla;
  final TextEditingController corporateVolumeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        AppDecimalField(
          controller: corporateVolumeController,
            label: "Volume Corporativo (Ex: 500,5 hectares)",
            onChanged: (v){
            final value = v?.replaceAll(",", ".");
              controller.product.setAttribute<double>(
                  AttributeKeys.corporate.volume, double.tryParse(value!) ?? 0.0
              );
            }
        ),
        AppSelectField<CorporateContractEnum>(
            label: "Contrato",
            items: CorporateContractEnum.values.toList(),
            selectedValue: contract,
            onSelected: (v){
              controller.product.setAttribute<String>(
                  AttributeKeys.corporate.contract, v.toString()
              );
              setState(() {
                contract = v;
              });
            }
        ),
        AppSelectField<CorporateSlaEnum>(
            label: "SLA",
            items: CorporateSlaEnum.values.toList(),
            selectedValue: sla,
            onSelected: (v){
              controller.product.setAttribute<String>(
                  AttributeKeys.corporate.sla, v.toString()
              );
              setState(() {
                sla = v;
              });
            },
        )
      ],
    );
  }
}
