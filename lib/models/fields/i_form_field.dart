import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../products/product.dart';

abstract class IFormField<T> {
  final String label;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  IFormField({
    required this.label,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
  });

  Widget build() {
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
