import 'package:altforce_budget_module/core/constants/attributes_keys.dart';
import 'package:flutter/material.dart';
import '../../../../../../models/fields/app_decimal_field.dart';
import '../../../../../../models/fields/app_select_field.dart';
import '../../../product_detail_controller.dart';
import 'enums/contract_enum.dart';
import 'enums/sla_enum.dart';

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
  ContractEnum? contract;
  SlaEnum? sla;
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
        AppSelectField<ContractEnum>(
            label: "Contrato",
            items: ContractEnum.values.toList(),
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
        AppSelectField<SlaEnum>(
            label: "SLA",
            items: SlaEnum.values.toList(),
            selectedValue: sla,
            onSelected: (v){
              controller.product.setAttribute<int>(
                  AttributeKeys.corporate.sla, v.days
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
