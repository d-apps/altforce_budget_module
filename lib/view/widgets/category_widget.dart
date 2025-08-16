import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const CategoryWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[100],
          radius: 25,
          child: Icon(icon, size: 15, color: Colors.green),
        ),
        const SizedBox(height: 5),
        Text(
            title,
            style: TextStyle(
              fontSize: 9.5,
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
        )
      ],
    );
  }
}
