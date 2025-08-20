import 'package:flutter/material.dart';
import '../../../../../../core/constants/attributes_keys.dart';
import '../../../../../../models/fields/app_select_field.dart';
import '../../../product_detail_controller.dart';
import 'enums/certification_enum.dart';
import 'enums/industrial_capacity_enum.dart';
import 'enums/voltage_enum.dart';

class IndustrialForm extends StatefulWidget {
  final ProductDetailController controller;

  const IndustrialForm({
    required this.controller,
    super.key
  });

  @override
  State<IndustrialForm> createState() => _IndustrialFormState();
}

class _IndustrialFormState extends State<IndustrialForm> {

  ProductDetailController get controller => widget.controller;
  VoltageEnum? voltage;
  CertificationEnum? certification;
  IndustrialCapacityEnum? capacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        AppSelectField<VoltageEnum>(
            label: "Voltagem",
            items: VoltageEnum.values.toList(),
            selectedValue: voltage,
            onSelected: (v){
              controller.product.setAttribute<int>(
                  AttributeKeys.industrial.voltage,
                  v.voltage
              );
              setState(() {
                voltage = v;
              });
            }
        ),
        AppSelectField<CertificationEnum>(
            label: "Certificação",
            items: CertificationEnum.values.toList(),
            selectedValue: certification,
            onSelected: (v){
              controller.product.setAttribute(
                  AttributeKeys.industrial.certification,
                  v.toString()
              );
              setState(() {
                certification = v;
              });
            }
        ),
        AppSelectField<IndustrialCapacityEnum>(
            label: "Capacidade Industrial",
            items: IndustrialCapacityEnum.values.toList(),
            selectedValue: capacity,
            onSelected: (v){
              controller.product.setAttribute(
                  AttributeKeys.industrial.industrialCapacity,
                  v.toString()
              );
              setState(() {
                capacity = v;
              });
            }
        ),
      ],
    );
  }
}
