import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:stardy_app/Pages/Learn_Page/models/course_model.dart';
import 'package:stardy_app/Core/color_codes.dart';
import 'package:stardy_app/Pages/Learn_Page/data/video_learning_data.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/notes_page.dart';

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

  final List<String> tabs = ["Transcript", "Notes", "Summary"];

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

      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: true,
        controlsVisibleAtStart: false,
      ),
    );

    _controller!.addListener(() {
      if (_controller!.value.position >= _controller!.value.metaData.duration &&
          !_controller!.value.isPlaying) {
        completedVideos.add(videoId);
      }

      if (mounted) setState(() {});
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

  int _activeTranscriptIndex() {
    if (_controller == null) return 0;

    final positionSeconds = _controller!.value.position.inSeconds;

    int active = 0;

    for (int i = 0; i < videoDetails.transcripts.length; i++) {
      if (positionSeconds >= videoDetails.transcripts[i].seconds) {
        active = i;
      }
    }

    return active;
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
        body: const Center(child: CircularProgressIndicator()),
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
        progressColors: ProgressBarColors(
          playedColor: AppColors.primary,
          handleColor: AppColors.primary,
        ),
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
            body: SafeArea(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,

                    children: [
                      player,

                      Positioned(
                        top: 10,
                        left: 10,
                        child: _circleIcon(
                          Icons.arrow_back,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: Row(
                          children: [
                            _circleIcon(Icons.closed_caption_outlined, onTap: () {}),
                            SizedBox(width: 8),
                            _circleIcon(Icons.settings_outlined, onTap: () {}),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          _circleIcon(
                            Icons.skip_previous_rounded,
                            onTap: previousVideo,
                            size: 44,
                          ),

                          SizedBox(width: 18),

                          _circleIcon(
                            _controller!.value.isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            onTap: togglePlayPause,
                            size: 58,
                            filled: true,
                          ),

                          SizedBox(width: 18),

                          _circleIcon(
                            Icons.skip_next_rounded,
                            onTap: nextVideo,
                            size: 44,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          allVideos[currentIndex]["title"] ?? widget.course.title,

                          style: GoogleFonts.mukta(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          widget.course.description,

                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                          style: GoogleFonts.mukta(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),

                    child: Row(
                      children: List.generate(tabs.length, (index) {
                        bool selected = selectedTab == index;

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),

                          child: GestureDetector(
                            onTap: () => setState(() => selectedTab = index),

                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),

                              decoration: BoxDecoration(
                                color: selected ? Colors.black : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: selected
                                      ? Colors.black
                                      : Colors.grey.shade300,
                                ),
                              ),

                              child: Text(
                                tabs[index],

                                style: GoogleFonts.mukta(
                                  color: selected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const Divider(height: 24),

                  Expanded(child: _buildSelectedTab()),

                  _bottomBar(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _circleIcon(
    IconData icon, {
    required VoidCallback onTap,
    double size = 38,
    bool filled = false,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: size,
        width: size,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? Colors.white : Colors.black.withValues(alpha: 0.35),
          border: filled ? null : Border.all(color: Colors.white, width: 1.4),
        ),

        child: Icon(
          icon,
          color: filled ? Colors.black : Colors.white,
          size: size * 0.55,
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),

      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade300),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: currentIndex == 0 ? null : previousVideo,
              icon: const Icon(Icons.arrow_back, size: 16, color: Colors.black),
              label: Text(
                "Back",
                style: GoogleFonts.mukta(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),

          SizedBox(width: 12),

          GestureDetector(
            onTap: () => setState(() => selectedTab = 1),

            child: Container(
              height: 48,
              width: 48,

              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(14),
              ),

              child: const Icon(Icons.notes_rounded, color: Colors.black),
            ),
          ),

          SizedBox(width: 12),

          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: currentIndex == allVideos.length - 1 ? null : nextVideo,
              icon: const Icon(Icons.arrow_forward, size: 16),
              label: Text(
                "Next",
                style: GoogleFonts.mukta(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedTab() {
    switch (selectedTab) {
      case 0:
        return _buildTranscriptTab();

      case 1:
        return const NotesPage();

      case 2:
        return _buildSummaryTab();

      default:
        return _buildTranscriptTab();
    }
  }

  Widget _buildTranscriptTab() {
    final activeIndex = _activeTranscriptIndex();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      itemCount: videoDetails.transcripts.length,

      itemBuilder: (context, index) {
        final t = videoDetails.transcripts[index];
        final active = index == activeIndex;

        return GestureDetector(
          onTap: () {
            _controller?.seekTo(Duration(seconds: t.seconds));
            _controller?.play();
          },

          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(
                  width: 52,

                  child: Text(
                    t.time,

                    style: GoogleFonts.mukta(
                      color: active ? Colors.black : Colors.grey.shade500,
                      fontWeight: active ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ),

                Expanded(
                  child: Text(
                    t.summary,

                    style: GoogleFonts.mukta(
                      color: active ? Colors.black : Colors.grey.shade500,
                      fontWeight: active ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSummaryTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Text(
        videoDetails.summary,

        style: GoogleFonts.mukta(color: Colors.black, fontSize: 15, height: 1.7),
      ),
    );
  }
}
