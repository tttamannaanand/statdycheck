import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CareerInterestSection
    extends StatelessWidget {
  const CareerInterestSection({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Align(
      alignment:
          Alignment.centerLeft,

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Text(
            'Career Interests',
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  FontWeight.w700,
            ),
          ),

          const SizedBox(
            height: 14,
          ),

          Wrap(
            alignment:
                WrapAlignment.start,
            spacing: 12,
            runSpacing: 12,

            children: [
              _chip(
                context,
                'UI/UX Designer',
                '/uiux',
              ),

              _chip(
                context,
                'Front End Dev',
                '/frontend',
              ),

              _chip(
                context,
                'Data Analyst',
                '/data',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(
    BuildContext context,
    String title,
    String route,
  ) {
    return GestureDetector(
      onTap:
          () => context.push(
            route,
          ),

      child: Container(
        padding:
            const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),

        decoration:
            BoxDecoration(
          borderRadius:
              BorderRadius.circular(
            28,
          ),

          border: Border.all(
            color:
                const Color(
              0xFFBE1E4A,
            ),
            width: 1.8,
          ),
        ),

        child: Text(
          title,
          style:
              const TextStyle(
            color:
                Color(
              0xFFBE1E4A,
            ),
            fontSize: 12,
            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),
    );
  }
}