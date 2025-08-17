import 'package:flutter/material.dart';

import '../../../../models/fields/app_number_field.dart';
import '../../../../models/fields/app_select_field.dart';

class ResidentialForm extends StatelessWidget {
  const ResidentialForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        AppSelectField<String>(
            label: "Cor",
            items: ["Verde", "Amarelo"],
            selectedValue: null,
            onSelected: (v){}
        ),
        AppSelectField<String>(
          label: "Garantia",
          items: ["6 meses", "12 meses"],
          selectedValue: null,
          onSelected: (v){},
        ),
        AppSelectField<String>(
          label: "Aacabamento",
          items: ["Fosco", "Brilhante"],
          selectedValue: null,
          onSelected: (v){},
        )
      ],
    );
  }
}
