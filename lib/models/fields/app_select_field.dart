import 'package:altforce_budget_module/models/fields/i_form_field.dart' as ff;
import 'package:flutter/material.dart';

class AppSelectField<T> extends ff.IFormField<T> {
  final T? selectedValue;
  final List<T> items;
  final ValueChanged<T?> onSelected;

  const AppSelectField({
    required super.label,
    required this.items,
    required this.selectedValue,
    required this.onSelected,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label:"),
        Wrap(
          spacing: 8.0,
          children: items.map((item) {
            return ChoiceChip(
              label: Text(item.toString()),
              selected: item == selectedValue,
              onSelected: (isSelected) {
                if (isSelected) {
                  onSelected.call(item);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}



/*
DropdownButtonFormField<T>(
      value: selectedValue,
      decoration: InputDecoration(labelText: label),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onSelected,
    )
 */