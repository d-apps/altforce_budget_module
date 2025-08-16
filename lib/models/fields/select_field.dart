import 'package:altforce_budget_module/models/fields/i_form_field.dart' as ff;
import 'package:flutter/material.dart';

class SelectField<T> extends ff.IFormField<T> {
  final T? selectedValue;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onSelected;

  SelectField({
    required super.label,
    required this.items,
    required this.selectedValue,
    required this.onSelected,
  });

  @override
  Widget build() {
    return DropdownButtonFormField<T>(
      value: selectedValue,
      decoration: InputDecoration(labelText: label),
      items: items,
      onChanged: onSelected,
    );
  }
}