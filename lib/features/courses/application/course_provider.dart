import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/course_model.dart';

final subjectProvider = FutureProvider.family<SubjectModel, String>((ref, subjectId) async {
  return SubjectModel(
    title: 'UI UX Design',
    description:
        'UI/UX Design focuses on creating intuitive, user-centered digital experiences by combining visual design with usability principles. It involves understanding user needs,',
    skillsToKnow: const ['Empathy', 'Research', 'User Testing'],
    durationHours: 5,
    instructorAvatarUrl: 'https://i.pravatar.cc/300?img=13',
    lessons: const [
      LessonModel(
        title: 'Basics of Figma II',
        thumbnailUrl: 'https://picsum.photos/seed/figma1/200/200',
        level: CourseLevel.beginner,
        completed: true,
      ),
      LessonModel(
        title: 'Color Tokens',
        thumbnailUrl: 'https://picsum.photos/seed/color1/200/200',
        level: CourseLevel.beginner,
        completed: true,
      ),
      LessonModel(
        title: 'Prototyping',
        thumbnailUrl: 'https://picsum.photos/seed/proto1/200/200',
        level: CourseLevel.intermediate,
        completed: true,
      ),
      LessonModel(
        title: 'Work ethics',
        thumbnailUrl: 'https://picsum.photos/seed/ethics1/200/200',
        level: CourseLevel.advance,
        completed: true,
      ),
    ],
    upcoming: const [
      LessonModel(
        title: 'Basics of Figma',
        thumbnailUrl: 'https://picsum.photos/seed/figma2/200/200',
        level: CourseLevel.beginner,
        completed: false,
      ),
    ],
  );
});
