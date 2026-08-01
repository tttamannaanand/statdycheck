class Assignment {
  final String title;
  final String status;
  final String description;
  final List<String> topics;
  final String deadline;
  final String reviewNotes;

  const Assignment({
    required this.title,
    required this.status,
    required this.description,
    required this.topics,
    required this.deadline,
    required this.reviewNotes,
  });
}
