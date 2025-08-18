import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class IFormField<T> extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;

  const IFormField({
    required this.label,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.initialValue,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
