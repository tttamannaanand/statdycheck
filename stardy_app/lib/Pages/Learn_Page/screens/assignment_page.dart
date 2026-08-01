import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stardy_app/Pages/Learn_Page/data/assignment_data.dart';
import 'package:stardy_app/Pages/Learn_Page/screens/assignment_submission_page.dart';

class AssignmentPage extends StatelessWidget {
  final String title;

  const AssignmentPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Find assignment matching title, or get first
    final assignment = assignmentsList.firstWhere(
      (a) => a.title == title,
      orElse: () => assignmentsList.first,
    );

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          assignment.title,

          style: GoogleFonts.mukta(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

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
                    color: Colors.black.withValues(alpha: 0.06),

                    blurRadius: 10,

                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    assignment.title,

                    style: GoogleFonts.mukta(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,

                    children: [
                      _statusChip(
                        assignment.status,
                        Colors.orange,
                        Icons.access_time,
                      ),
                    ],
                  ),

                  SizedBox(height: 25),

                  Text(
                    assignment.description,

                    style: GoogleFonts.mukta(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    "Topics Included",

                    style: GoogleFonts.mukta(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 15),

                  Column(
                    children: assignment.topics.map((topic) => _topicTile(topic)).toList(),
                  ),

                  SizedBox(height: 30),

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.orange),

                        SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Submission Deadline",

                                style: GoogleFonts.mukta(fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 4),

                              Text(
                                assignment.deadline,

                                style: GoogleFonts.mukta(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 25),

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(16),

                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.08),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Icon(Icons.info_outline, color: Colors.blue),

                        SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Review Notes",

                                style: GoogleFonts.mukta(fontWeight: FontWeight.bold),
                              ),

                              SizedBox(height: 6),

                              Text(
                                assignment.reviewNotes,

                                style: GoogleFonts.mukta(
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

            SizedBox(height: 100),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: 55,

            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AssignmentSubmissionPage(),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),

              child: Text(
                "Submit Assignment",

                style: GoogleFonts.mukta(
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

  Widget _statusChip(String text, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),

        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, color: color, size: 18),

          SizedBox(width: 6),

          Flexible(
            child: Text(
              text,

              overflow: TextOverflow.ellipsis,

              style: GoogleFonts.mukta(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topicTile(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 22),

          SizedBox(width: 10),

          Expanded(child: Text(text, style: GoogleFonts.mukta(fontSize: 15))),
        ],
      ),
    );
  }
}
