import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE9E9E9),
            width: 1,
          ),
        ),
      ),

      child: Row(
        children: [
          Icon(
            icon,
            size: 26,
            color: const Color(
              0xFF1A1A1A,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.w500,
                color: Color(
                  0xFF16161E,
                ),
              ),
            ),
          ),

          if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

          const SizedBox(width: 8),

          const Icon(
            Icons.chevron_right,
            size: 24,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}