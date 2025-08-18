import 'package:flutter/material.dart';

class BudgetText extends StatelessWidget {
  final String label;
  final String text;

  const BudgetText({
    required this.label,
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
