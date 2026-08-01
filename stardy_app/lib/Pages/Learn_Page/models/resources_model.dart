class NoteItem {
  final String title;
  final String module;
  final String size;
  final String topic;
  final String content;

  const NoteItem({
    required this.title,
    required this.module,
    required this.size,
    required this.topic,
    required this.content,
  });
}

class ReferenceItem {
  final String title;
  final String author;
  final String url;

  const ReferenceItem({
    required this.title,
    required this.author,
    required this.url,
  });
}
