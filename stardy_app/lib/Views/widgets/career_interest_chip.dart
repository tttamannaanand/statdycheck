import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CareerInterestSection extends StatelessWidget {
  const CareerInterestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Career Interests',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF16161E),
          ),
        ),

        const SizedBox(height: 22),

        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            _careerChip(
              context,
              title: 'UI/UX Designer',
              route: '/uiux',
            ),

            _careerChip(
              context,
              title: 'Front End Developer',
              route: '/frontend',
            ),

            _careerChip(
              context,
              title: 'Data Analyst',
              route: '/data-analyst',
            ),
          ],
        ),
      ],
    );
  }

  Widget _careerChip(
    BuildContext context, {
    required String title,
    required String route,
  }) {
    return GestureDetector(
      onTap: () {
        context.push(route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color(0xFFB61D45),
            width: 2,
          ),
          color: Colors.transparent,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFB61D45),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}