import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../application/course_provider.dart';
import '../widgets/lesson_tile.dart';

class SubjectLessonsScreen extends ConsumerWidget {
  const SubjectLessonsScreen({super.key, required this.subjectId});

  final String subjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectAsync = ref.watch(subjectProvider(subjectId));

    return Scaffold(
      backgroundColor: AppColors.textPrimary,
      body: subjectAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.accentRed)),
        error: (e, s) => Center(child: Text('Something went wrong', style: AppTextStyles.body.copyWith(color: AppColors.background))),
        data: (subject) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.chevron_left_rounded, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: subject.lessons.length,
                    itemBuilder: (context, index) => LessonTile(
                      lesson: subject.lessons[index],
                      onTap: () => context.push('/subjects/$subjectId/detail'),
                    ),
                  ),
                ),
                if (subject.isFinished)
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
                        child: const Icon(Icons.flag_rounded, color: Colors.white, size: 15),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "YAY ! You've finished it !",
                        style: AppTextStyles.body.copyWith(color: AppColors.background, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
