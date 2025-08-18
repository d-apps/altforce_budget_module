import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'i_form_field.dart' as ff;

class AppDecimalField extends ff.IFormField {

  AppDecimalField({
    required super.label,
    required super.onChanged,
    super.controller,
    super.key
  }) : super(
    keyboardType: TextInputType.numberWithOptions(
      decimal: true
    ),
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '###,#',
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy, // Optional: changes how the mask is applied
        ),
  ]);
}
