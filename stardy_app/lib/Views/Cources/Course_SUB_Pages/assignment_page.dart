import 'package:flutter/material.dart';

class AssignmentPage extends StatelessWidget {
  final String title;

  const AssignmentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      // =====================================================
      // APP BAR
      // =====================================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          title,

          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,

              padding: EdgeInsets.all(width * 0.05),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(24),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),

                    blurRadius: 10,

                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // =================================================
                  // TITLE
                  // =================================================
                  Text(
                    title,

                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =================================================
                  // STATUS SECTION
                  // =================================================
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,

                    children: [
                      _statusChip(
                        "Pending Review",
                        Colors.orange,
                        Icons.access_time,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // =================================================
                  // DESCRIPTION
                  // =================================================
                  const Text(
                    "Create a modern and responsive assignment project based on the given topic. Students should follow proper UI design principles and submit the assignment before the deadline.",

                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // =================================================
                  // TOPICS
                  // =================================================
                  const Text(
                    "Topics Included",

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  _topicTile("Responsive UI Design"),

                  _topicTile("Flutter Widgets"),

                  _topicTile("State Management"),

                  _topicTile("Navigation System"),

                  const SizedBox(height: 30),

                  // =================================================
                  // DEADLINE CARD
                  // =================================================
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.orange),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: const [
                              Text(
                                "Submission Deadline",

                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 4),

                              Text(
                                "25 May 2026",

                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =================================================
                  // REVIEW NOTES
                  // =================================================
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.08),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Icon(Icons.info_outline, color: Colors.blue),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: const [
                              Text(
                                "Review Notes",

                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 6),

                              Text(
                                "Your assignment will be reviewed by the instructor after submission. Make sure all required topics are completed properly.",

                                style: TextStyle(
                                  color: Colors.grey,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),

      // =====================================================
      // SUBMIT BUTTON
      // =====================================================
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: 55,

            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),

              child: const Text(
                "Submit Assignment",

                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // STATUS CHIP
  // =====================================================

  Widget _statusChip(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

      decoration: BoxDecoration(
        color: color.withOpacity(0.1),

        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: color, size: 18),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              text,

              overflow: TextOverflow.ellipsis,

              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // TOPIC TILE
  // =====================================================

  Widget _topicTile(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 22),

          const SizedBox(width: 10),

          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }
}
