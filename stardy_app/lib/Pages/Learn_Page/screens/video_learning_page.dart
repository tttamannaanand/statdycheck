import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Core/color_codes.dart';
import 'package:stardy_app/Pages/Learn_Page/data/video_learning_data.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            widget.course.title,
            style: GoogleFonts.mukta(color: Colors.black),
          ),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
      player: YoutubePlayer(
        key: ValueKey(currentVideoId),
        controller: _controller!,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (_controller != null && _controller!.value.isFullScreen) {
              _controller!.toggleFullScreenMode();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.background,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Text(
                widget.course.title,
                style: GoogleFonts.mukta(color: Colors.black),
              ),
            ),
            body: Column(
              children: [
                player,

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
                        color: Colors.orange,
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

                SizedBox(height: 20),

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
                              style: GoogleFonts.mukta(
                                color: selectedTab == index
                                    ? Colors.orange
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Container(
                              height: 3,
                              width: 90,
                              color: selectedTab == index
                                  ? Colors.orange
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Expanded(child: _buildSelectedTab()),
              ],
            ),
          ),
        );
      },
    );
  }

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

  Widget _buildTranscriptTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: videoDetails.transcripts.map((t) {
        return _transcriptTile(
          t.time,
          t.title,
          t.summary,
          t.seconds,
        );
      }).toList(),
    );
  }

  Widget _buildNextVideosTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),

      itemCount: widget.course.chapters.length,

      itemBuilder: (context, chapterIndex) {
        var chapter = widget.course.chapters[chapterIndex];

        return ExpansionTile(
          collapsedIconColor: Colors.black,

          iconColor: Colors.orange,

          title: Text(
            chapter.title,

            style: GoogleFonts.mukta(
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
              leading: const Icon(Icons.play_circle_fill, color: Colors.orange),

              title: Text(
                topic.title,

                style: GoogleFonts.mukta(color: Colors.black),
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

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Container(
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.08),

          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              "Video Summary",

              style: GoogleFonts.mukta(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text(
              videoDetails.summary,

              style: GoogleFonts.mukta(color: Colors.black, fontSize: 16, height: 1.7),
            ),
          ],
        ),
      ),
    );
  }

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
          color: Colors.black.withOpacity(0.08),

          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

              decoration: BoxDecoration(
                color: Colors.orange,

                borderRadius: BorderRadius.circular(8),
              ),

              child: Text(
                time,

                style: GoogleFonts.mukta(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 14),

            Text(
              title,

              style: GoogleFonts.mukta(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              summary,

              style: GoogleFonts.mukta(color: Colors.black, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
