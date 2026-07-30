import 'package:flutter/material.dart';

class BadgesCard
    extends StatelessWidget {
  const BadgesCard({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        right: 10,
      ),

      padding:
          const EdgeInsets.all(
        22,
      ),

      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(
          34,
        ),

        gradient:
            const LinearGradient(
          begin:
              Alignment.topLeft,
          end:
              Alignment.bottomRight,
          colors: [
            Color(0xFF2D2E35),
            Color(0xFF1E1F24),
          ],
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const Text(
            'Badges',
            style: TextStyle(
              color:
                  Colors.white,
              fontSize: 20,
              fontWeight:
                  FontWeight.w700,
            ),
          ),

          const SizedBox(
            height: 22,
          ),

          /// smaller badges
          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceEvenly,

            children: const [
              _Badge(
                icon:
                    Icons.edit,
                color:
                    Color(
                  0xFFD7254F,
                ),
              ),

              _Badge(
                icon:
                    Icons.code,
                color:
                    Color(
                  0xFF7D88AA,
                ),
              ),

              _Badge(
                icon:
                    Icons.bar_chart,
                color:
                    Color(
                  0xFFD8B649,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge
    extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _Badge({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: 54, // smaller
      height: 54,

      decoration: BoxDecoration(
        shape:
            BoxShape.circle,

        gradient:
            LinearGradient(
          colors: [
            color,
            color.withOpacity(
              0.72,
            ),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color:
                color.withOpacity(
              0.22,
            ),
            blurRadius: 10,
            offset:
                const Offset(
              0,
              4,
            ),
          ),
        ],
      ),

      child: Icon(
        icon,
        size: 24, // smaller icon
        color:
            Colors.white,
      ),
    );
  }
}