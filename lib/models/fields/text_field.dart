import 'package:flutter/services.dart';
import 'i_form_field.dart' as ff;

class NumberField extends ff.IFormField {

  NumberField({
    required super.label,
    required super.onChanged,
    super.keyboardType = TextInputType.text,
  });

}
