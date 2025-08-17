import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class IFormField<T> extends StatelessWidget {
  final String label;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const IFormField({
    required this.label,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
