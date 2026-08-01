import '../models/video_learning_model.dart';

const VideoDetails videoDetails = VideoDetails(
  summary: "This video explains Flutter widgets including StatelessWidget and StatefulWidget. It also covers navigation, UI building, and state management concepts used in Flutter applications.",
  transcripts: [
    TranscriptSegment(
      time: "00:00",
      title: "Introduction",
      summary: "Introduction about Flutter and widgets.",
      seconds: 0,
    ),
    TranscriptSegment(
      time: "02:15",
      title: "Stateless Widget",
      summary: "Explanation about Stateless widgets.",
      seconds: 135,
    ),
    TranscriptSegment(
      time: "05:40",
      title: "Stateful Widget",
      summary: "Understanding Stateful widgets.",
      seconds: 340,
    ),
    TranscriptSegment(
      time: "10:30",
      title: "Navigation",
      summary: "Navigation and routing in Flutter.",
      seconds: 630,
    ),
  ],
);
