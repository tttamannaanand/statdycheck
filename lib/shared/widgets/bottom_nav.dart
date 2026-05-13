import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/colors.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  const BottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home
          GestureDetector(
            onTap: () => context.go('/home'),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: currentIndex == 0 ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.home_rounded,
                color: currentIndex == 0 ? AppColors.black : AppColors.white,
                size: 24,
              ),
            ),
          ),

          // Learn
          GestureDetector(
            onTap: () => context.go('/learn'),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: currentIndex == 1 ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.menu_book_outlined,
                color: currentIndex == 1 ? AppColors.black : AppColors.white,
                size: 24,
              ),
            ),
          ),

          // Opportunities
          GestureDetector(
            onTap: () => context.go('/opportunities'),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: currentIndex == 2 ? AppColors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.work_outline,
                color: currentIndex == 2 ? AppColors.black : AppColors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
