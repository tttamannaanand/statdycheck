import 'package:go_router/go_router.dart';
import '../../features/courses/presentation/screens/course_detail_screen.dart';
import '../../features/courses/presentation/screens/subject_lessons_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/profile',
  routes: [
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/subjects/:subjectId/detail',
      builder: (context, state) => CourseDetailScreen(
        subjectId: state.pathParameters['subjectId']!,
      ),
    ),
    GoRoute(
      path: '/subjects/:subjectId/lessons',
      builder: (context, state) => SubjectLessonsScreen(
        subjectId: state.pathParameters['subjectId']!,
      ),
    ),
  ],
);
