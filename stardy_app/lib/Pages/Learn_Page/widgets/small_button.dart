import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final IconData? icon;

  const SmallButton({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        children: [
          if (icon != null) ...[Icon(icon, size: 18), SizedBox(width: 5)],
          Text(text),
        ],
      ),
    );
  }
}
