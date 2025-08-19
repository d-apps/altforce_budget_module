import 'package:flutter/material.dart';

class BudgetText extends StatelessWidget {
  final String label;
  final TextStyle? labelStyle;
  final String text;
  final TextStyle? textStyle;

  const BudgetText({
    required this.label,
    this.labelStyle,
    required this.text,
    this.textStyle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle ?? const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: textStyle ?? const TextStyle(
            fontSize: 12,
          ),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
