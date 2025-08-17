import 'package:flutter/material.dart';

import '../../../../models/fields/app_number_field.dart';
import '../../../../models/fields/app_select_field.dart';

class IndustrialForm extends StatelessWidget {
  const IndustrialForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSelectField<String>(
            label: "Voltagem",
            items: ["200V", "380V"],
            selectedValue: null,
            onSelected: (v){}
        ),
        const SizedBox(height: 8),
        AppSelectField<String>(
            label: "Certificação",
            items: ["NR-10", "ISO 9001"],
            selectedValue: null,
            onSelected: (v){}
        ),
        const SizedBox(height: 8),
        AppNumberField(
            label: "Capacidade Industrial (kg/h)",
            onChanged: (v){}
        ),
      ],
    );
  }
}
