class TranscriptSegment {
  final String time;
  final String title;
  final String summary;
  final int seconds;

  const TranscriptSegment({
    required this.time,
    required this.title,
    required this.summary,
    required this.seconds,
  });
}

class VideoDetails {
  final String summary;
  final List<TranscriptSegment> transcripts;

  const VideoDetails({
    required this.summary,
    required this.transcripts,
  });
}
