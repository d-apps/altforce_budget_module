import 'package:flutter/material.dart';
import '../../../../../models/fields/app_number_field.dart';
import '../../../../../models/fields/app_select_field.dart';

class CorporateForm extends StatelessWidget {
  const CorporateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        AppNumberField(
            label: "Volume Corporativo",
            onChanged: (v){}
        ),
        AppSelectField<String>(
            label: "Contrato",
            items: ["Longo Prazo", "Sobre demanda"],
            selectedValue: "Longo Prazo",
            onSelected: (v){}
        ),
        AppSelectField<String>(
            label: "SLA",
            items: ["24x7", "8x5"],
            selectedValue: null,
            onSelected: (v){},
        )
      ],
    );
  }
}
