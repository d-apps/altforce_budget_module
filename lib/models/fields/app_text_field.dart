import 'package:flutter/services.dart';
import 'i_form_field.dart';

class AppTextField extends IFormField {

  const AppTextField({
    required super.label,
    required super.onChanged,
    super.keyboardType = TextInputType.text,
    super.key
  });

}
