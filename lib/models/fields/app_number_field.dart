import 'package:flutter/services.dart';
import 'i_form_field.dart' as ff;

class AppNumberField extends ff.IFormField {

  AppNumberField({
    required super.label,
    required super.onChanged,
    super.controller,
    super.initialValue,
    super.key
  }) : super(
    keyboardType: TextInputType.number,
      inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
  ]);
}
