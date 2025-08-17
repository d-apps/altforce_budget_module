import 'package:flutter/services.dart';
import 'i_form_field.dart' as ff;

class AppNumberField extends ff.IFormField {

  AppNumberField({
    required super.label,
    required super.onChanged,
    super.keyboardType = TextInputType.number,
    super.key
  }) : super(
      inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
  ]);
}
