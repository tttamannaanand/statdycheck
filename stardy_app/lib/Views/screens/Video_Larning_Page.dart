import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widgets/Course_Source/courseModel.dart';
import '../widgets/color_codes.dart';

class VideoLearningPage extends StatefulWidget {
  final Course course;

  const VideoLearningPage({super.key, required this.course});

  @override
  State<VideoLearningPage> createState() => _VideoLearningPageState();
}

class _VideoLearningPageState extends State<VideoLearningPage> {
  YoutubePlayerController? _controller;

  int currentIndex = 0;
  String? currentVideoId;
  Set<String> completedVideos = {};

  List<Map<String, String>> allVideos = [];

  @override
  void initState() {
    super.initState();
    flattenVideos();
    if (allVideos.isNotEmpty) {
      loadVideo(0);
    }
  }

  void flattenVideos() {
    allVideos.clear();

    for (var chapter in widget.course.chapters) {
      for (var topic in chapter.topics) {
        allVideos.add({"title": topic.title, "url": topic.videoUrl});
      }
    }
  }

  void loadVideo(int index) {
    String url = allVideos[index]["url"]!;
    String videoId = YoutubePlayer.convertUrlToId(url)!;

    _controller?.dispose();

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    _controller!.addListener(() {
      setState(() {});

      if (_controller!.value.position >= _controller!.value.metaData.duration &&
          !_controller!.value.isPlaying) {
        completedVideos.add(videoId);
      }
    });

    setState(() {
      currentIndex = index;
      currentVideoId = videoId;
    });
  }

  /// ---------------- CONTROLS ----------------
  void togglePlayPause() {
    if (_controller == null) return;

    if (_controller!.value.isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }
    setState(() {});
  }

  void nextVideo() {
    if (currentIndex < allVideos.length - 1) {
      loadVideo(currentIndex + 1);
    }
  }

  void previousVideo() {
    if (currentIndex > 0) {
      loadVideo(currentIndex - 1);
    }
  }

  void skipForward() {
    final pos = _controller!.value.position;
    _controller!.seekTo(pos + const Duration(seconds: 10));
  }

  void skipBackward() {
    final pos = _controller!.value.position;
    _controller!.seekTo(pos - const Duration(seconds: 10));
  }

  double getProgress() {
    if (allVideos.isEmpty) return 0;
    return completedVideos.length / allVideos.length;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.course.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          if (_controller != null)
            YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: previousVideo,
                icon: const Icon(Icons.skip_previous, color: Colors.white),
              ),
              IconButton(
                onPressed: skipBackward,
                icon: const Icon(Icons.replay_10, color: Colors.white),
              ),
              IconButton(
                onPressed: togglePlayPause,
                icon: Icon(
                  _controller != null && _controller!.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  color: Colors.orange,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: skipForward,
                icon: const Icon(Icons.forward_10, color: Colors.white),
              ),
              IconButton(
                onPressed: nextVideo,
                icon: const Icon(Icons.skip_next, color: Colors.white),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: getProgress(),
                  backgroundColor: Colors.grey[800],
                  color: AppColors.primary,
                  minHeight: 8,
                ),
                const SizedBox(height: 6),
                Text(
                  "${(getProgress() * 100).toInt()}% Completed",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: widget.course.chapters.length,
              itemBuilder: (context, chapterIndex) {
                var chapter = widget.course.chapters[chapterIndex];

                return ExpansionTile(
                  collapsedIconColor: Colors.white,
                  iconColor: AppColors.primaryDark,
                  title: Text(
                    chapter.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  children: List.generate(chapter.topics.length, (topicIndex) {
                    var topic = chapter.topics[topicIndex];

                    String videoId = YoutubePlayer.convertUrlToId(
                      topic.videoUrl,
                    )!;

                    int flatIndex = allVideos.indexWhere(
                      (video) => video["url"] == topic.videoUrl,
                    );

                    IconData icon;
                    Color iconColor;

                    if (completedVideos.contains(videoId)) {
                      icon = Icons.check_circle;
                      iconColor = Colors.green;
                    } else if (flatIndex == currentIndex) {
                      icon = Icons.pause_circle;
                      iconColor = Colors.blue;
                    } else {
                      icon = Icons.play_circle_fill;
                      iconColor = Colors.orange;
                    }

                    return ListTile(
                      leading: Icon(icon, color: iconColor),
                      title: Text(
                        topic.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        loadVideo(flatIndex);
                      },
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
