import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/color_codes.dart';
import 'Opportunity_Source/opportunity_data.dart';
import 'Opportunity_Source/opportunity_model.dart';

// IMPORT STARBUDDY PAGE
import '../../Views/screens/chat_BOT.dart';

class OpportunitiesPage extends StatefulWidget {
  const OpportunitiesPage({super.key});

  @override
  State<OpportunitiesPage> createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> {
  bool showInternships = true;

  @override
  Widget build(BuildContext context) {
    final opportunities = showInternships ? internships : projects;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ========================================================
      // FLOATING AI CHAT BUTTON
      // ========================================================
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),

        child: FloatingActionButton(
          backgroundColor: Colors.black,
          elevation: 10,

          // OPEN STARBUDDY PAGE
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StarBuddyPage()),
            );
          },

          child: const Icon(
            Icons.smart_toy_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

        title: Text(
          "Opportunities",

          style: GoogleFonts.mukta(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // ========================================================
            // TAB BAR
            // ========================================================
            Container(
              padding: const EdgeInsets.all(4),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [
                  _buildTab(
                    title: "Internships",
                    selected: showInternships,

                    onTap: () {
                      setState(() {
                        showInternships = true;
                      });
                    },
                  ),

                  _buildTab(
                    title: "Freelancing",
                    selected: !showInternships,

                    onTap: () {
                      setState(() {
                        showInternships = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ========================================================
            // LIST
            // ========================================================
            Expanded(
              child: ListView.builder(
                itemCount: opportunities.length,

                itemBuilder: (context, index) {
                  final opportunity = opportunities[index];

                  return OpportunityCard(opportunity: opportunity);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================
  // TAB BUTTON
  // ========================================================

  Widget _buildTab({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,

        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),

          decoration: BoxDecoration(
            color: selected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),

          child: Center(
            child: Text(
              title,

              style: GoogleFonts.mukta(
                color: selected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// OPPORTUNITY CARD
// ============================================================

class OpportunityCard extends StatelessWidget {
  final Opportunity opportunity;

  const OpportunityCard({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // ========================================================
          // TAGS
          // ========================================================
          Row(
            children: [
              _buildTag(
                title: opportunity.type,
                backgroundColor: Colors.black,
                textColor: Colors.white,
              ),

              const SizedBox(width: 10),

              _buildTag(
                title: opportunity.category,
                backgroundColor: Colors.black12,
                textColor: Colors.black,
              ),
            ],
          ),

          const SizedBox(height: 18),

          // ========================================================
          // TITLE
          // ========================================================
          Text(
            opportunity.title,

            style: GoogleFonts.mukta(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // ========================================================
          // COMPANY
          // ========================================================
          Text(
            "${opportunity.company} • ${opportunity.location}",

            style: GoogleFonts.mukta(color: Colors.black54, fontSize: 15),
          ),

          const SizedBox(height: 24),

          // ========================================================
          // BUTTON
          // ========================================================
          SizedBox(
            width: double.infinity,
            height: 52,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        OpportunityDetailsPage(opportunity: opportunity),
                  ),
                );
              },

              child: Text(
                "View Details",

                style: GoogleFonts.mukta(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================
  // TAG WIDGET
  // ========================================================

  Widget _buildTag({
    required String title,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Text(
        title,

        style: GoogleFonts.mukta(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ============================================================
// DETAILS PAGE
// ============================================================

class OpportunityDetailsPage extends StatelessWidget {
  final Opportunity opportunity;

  const OpportunityDetailsPage({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    final isInternship = opportunity.type.toLowerCase().contains("intern");

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          isInternship ? "Internship Details" : "Freelance Details",

          style: GoogleFonts.mukta(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        opportunity.title,

                        style: GoogleFonts.mukta(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 24),

                      _buildInfoRow(
                        Icons.business_outlined,
                        opportunity.company,
                      ),

                      _buildInfoRow(
                        Icons.location_on_outlined,
                        opportunity.location,
                      ),

                      _buildInfoRow(
                        Icons.access_time_outlined,
                        opportunity.duration,
                      ),

                      _buildInfoRow(Icons.currency_rupee, opportunity.stipend),

                      const SizedBox(height: 30),

                      Text(
                        "Description",

                        style: GoogleFonts.mukta(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        opportunity.description,

                        style: GoogleFonts.mukta(
                          fontSize: 15,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        "Skills",

                        style: GoogleFonts.mukta(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Wrap(
                        spacing: 10,
                        runSpacing: 10,

                        children: opportunity.skills.map((skill) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Text(
                              skill,

                              style: GoogleFonts.mukta(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 30),

                      Text(
                        "Responsibilities",

                        style: GoogleFonts.mukta(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      ...opportunity.responsibilities.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text("• "),

                              Expanded(
                                child: Text(
                                  item,

                                  style: GoogleFonts.mukta(
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isInternship
                            ? "Internship Application Submitted"
                            : "Freelance Project Applied",
                      ),
                    ),
                  );
                },

                child: Text(
                  isInternship ? "Apply Internship" : "Apply Freelance Project",

                  style: GoogleFonts.mukta(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================
  // INFO ROW
  // ========================================================

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

      child: Row(
        children: [
          Icon(icon, color: Colors.black54),

          const SizedBox(width: 10),

          Expanded(child: Text(text, style: GoogleFonts.mukta(fontSize: 16))),
        ],
      ),
    );
  }
}
