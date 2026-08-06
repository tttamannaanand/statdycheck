import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'courseModel.dart';
import '../../widgets/color_codes.dart';
import '../Course_SUB_Pages/quiz_page.dart';

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

  int selectedTab = 0;

  final List<String> tabs = ["Transcript", "Next Videos", "Summary"];

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

  // =====================================================
  // FLATTEN VIDEOS
  // =====================================================

  void flattenVideos() {
    allVideos.clear();

    for (var chapter in widget.course.chapters) {
      for (var topic in chapter.topics) {
        allVideos.add({"title": topic.title, "url": topic.videoUrl});
      }
    }
  }

  // =====================================================
  // LOAD VIDEO
  // =====================================================

  void loadVideo(int index) {
    String url = allVideos[index]["url"]!;

    String? videoId = YoutubePlayer.convertUrlToId(url);

    if (videoId == null) return;

    _controller?.dispose();

    _controller = YoutubePlayerController(
      initialVideoId: videoId,

      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    _controller!.addListener(() {
      if (_controller!.value.position >= _controller!.value.metaData.duration &&
          !_controller!.value.isPlaying) {
        completedVideos.add(videoId);
      }

      setState(() {});
    });

    setState(() {
      currentIndex = index;
      currentVideoId = videoId;
    });
  }

  // =====================================================
  // CONTROLS
  // =====================================================

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
    if (_controller == null) return;

    final pos = _controller!.value.position;

    _controller!.seekTo(pos + const Duration(seconds: 10));
  }

  void skipBackward() {
    if (_controller == null) return;

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

  // =====================================================
  // UI
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,

        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          widget.course.title,

          style: const TextStyle(color: Colors.black),
        ),

        actions: [
          IconButton(
            tooltip: 'Take Quiz',
            icon: const Icon(Icons.quiz_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuizPage(title: widget.course.title),
                ),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // =====================================================
          // VIDEO PLAYER
          // =====================================================
          if (_controller != null)
            YoutubePlayer(
              key: ValueKey(currentVideoId),

              controller: _controller!,

              showVideoProgressIndicator: true,
            ),

          // =====================================================
          // CONTROLS
          // =====================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              IconButton(
                onPressed: previousVideo,

                icon: const Icon(Icons.skip_previous, color: Colors.black),
              ),

              IconButton(
                onPressed: skipBackward,

                icon: const Icon(Icons.replay_10, color: Colors.black),
              ),

              IconButton(
                onPressed: togglePlayPause,

                icon: Icon(
                  _controller != null && _controller!.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,

                  color: AppColors.primary,
                  size: 40,
                ),
              ),

              IconButton(
                onPressed: skipForward,

                icon: const Icon(Icons.forward_10, color: Colors.black),
              ),

              IconButton(
                onPressed: nextVideo,

                icon: const Icon(Icons.skip_next, color: Colors.black),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // =====================================================
          // TABS
          // =====================================================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: List.generate(
                tabs.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = index;
                    });
                  },

                  child: Column(
                    children: [
                      Text(
                        tabs[index],

                        style: TextStyle(
                          color: selectedTab == index
                              ? AppColors.primary
                              : Colors.black,

                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Container(
                        height: 3,
                        width: 90,

                        color: selectedTab == index
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // =====================================================
          // TAB CONTENT
          // =====================================================
          Expanded(child: _buildSelectedTab()),
        ],
      ),
    );
  }

  // =====================================================
  // SELECTED TAB
  // =====================================================

  Widget _buildSelectedTab() {
    switch (selectedTab) {
      case 0:
        return _buildTranscriptTab();

      case 1:
        return _buildNextVideosTab();

      case 2:
        return _buildSummaryTab();

      default:
        return _buildTranscriptTab();
    }
  }

  // =====================================================
  // TRANSCRIPT TAB
  // =====================================================

  Widget _buildTranscriptTab() {
    return ListView(
      padding: const EdgeInsets.all(16),

      children: [
        _transcriptTile(
          "00:00",
          "Introduction",
          "Introduction about Flutter and widgets.",
          0,
        ),

        _transcriptTile(
          "02:15",
          "Stateless Widget",
          "Explanation about Stateless widgets.",
          135,
        ),

        _transcriptTile(
          "05:40",
          "Stateful Widget",
          "Understanding Stateful widgets.",
          340,
        ),

        _transcriptTile(
          "10:30",
          "Navigation",
          "Navigation and routing in Flutter.",
          630,
        ),
      ],
    );
  }

  // =====================================================
  // NEXT VIDEOS TAB
  // =====================================================

  Widget _buildNextVideosTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: widget.course.chapters.length,

      itemBuilder: (context, chapterIndex) {
        var chapter = widget.course.chapters[chapterIndex];

        return ExpansionTile(
          collapsedIconColor: Colors.black,

          iconColor: AppColors.primary,

          title: Text(
            chapter.title,

            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          children: List.generate(chapter.topics.length, (topicIndex) {
            var topic = chapter.topics[topicIndex];

            int flatIndex = allVideos.indexWhere(
              (video) => video["url"] == topic.videoUrl,
            );

            return ListTile(
              leading: const Icon(Icons.play_circle_fill, color: AppColors.primary),

              title: Text(
                topic.title,

                style: const TextStyle(color: Colors.black),
              ),

              onTap: () {
                loadVideo(flatIndex);

                setState(() {
                  selectedTab = 0;
                });
              },
            );
          }),
        );
      },
    );
  }

  // =====================================================
  // SUMMARY TAB
  // =====================================================

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.08),

          borderRadius: BorderRadius.circular(20),
        ),

        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Video Summary",

              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "This video explains Flutter widgets including StatelessWidget and StatefulWidget. It also covers navigation, UI building, and state management concepts used in Flutter applications.",

              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.7),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // TRANSCRIPT TILE
  // =====================================================

  Widget _transcriptTile(
    String time,
    String title,
    String summary,
    int seconds,
  ) {
    return GestureDetector(
      onTap: () {
        if (_controller != null) {
          _controller!.seekTo(Duration(seconds: seconds));

          _controller!.play();
        }
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 16),

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.08),

          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

              decoration: BoxDecoration(
                color: AppColors.primary,

                borderRadius: BorderRadius.circular(8),
              ),

              child: Text(
                time,

                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 14),

            Text(
              title,

              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              summary,

              style: const TextStyle(color: Colors.black, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
