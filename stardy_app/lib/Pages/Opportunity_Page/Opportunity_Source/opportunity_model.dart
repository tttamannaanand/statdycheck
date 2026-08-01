// ============================================================
// opportunity_model.dart
// ============================================================

class Opportunity {
  final String title;
  final String company;
  final String location;
  final String type;
  final String category;
  final String image;

  final String description;
  final String duration;
  final String stipend;

  final List<String> skills;
  final List<String> responsibilities;

  const Opportunity({
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.category,
    required this.description,
    required this.duration,
    required this.stipend,
    required this.skills,
    required this.responsibilities,
    this.image = '',
  });
}
