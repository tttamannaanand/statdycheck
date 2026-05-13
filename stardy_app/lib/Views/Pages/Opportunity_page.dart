import 'package:flutter/material.dart';
import 'package:stardy_app/Views/widgets/color_codes.dart';

import '../widgets/Opportunity_Source/opportunity_data.dart';
import '../widgets/Opportunity_Source/opportunity_model.dart';

class OpportunitiesPage extends StatefulWidget {
  const OpportunitiesPage({super.key});

  @override
  State<OpportunitiesPage> createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage> {
  bool _isSearching = false;

  bool _showInternships = true;

  @override
  Widget build(BuildContext context) {
    final List<Opportunity> currentList = _showInternships
        ? internships
        : projects;

    return Scaffold(
      backgroundColor: AppColors.background,

      // =====================================================
      // APP BAR
      // =====================================================
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),

        child: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,

          title: const Text(
            "Opportunities",

            style: TextStyle(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),

              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black12,

                backgroundImage: AssetImage('assets/images/stardy-logo.png'),
              ),
            ),
          ],

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),

            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),

              child: _isSearching
                  ?
                    // =====================================================
                    // SEARCH BAR
                    // =====================================================
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(30),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),

                            blurRadius: 12,

                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.black54),

                          const SizedBox(width: 10),

                          Expanded(
                            child: TextField(
                              autofocus: true,

                              style: const TextStyle(color: Colors.black),

                              decoration: const InputDecoration(
                                hintText:
                                    "Search internships, skills or companies",

                                hintStyle: TextStyle(color: Colors.black54),

                                border: InputBorder.none,
                              ),

                              onSubmitted: (value) {
                                setState(() {
                                  _isSearching = false;
                                });
                              },
                            ),
                          ),

                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 20,
                            ),

                            onPressed: () {
                              setState(() {
                                _isSearching = false;
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  :
                    // =====================================================
                    // TABS
                    // =====================================================
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(4),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(20),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),

                                  blurRadius: 10,

                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                // =====================================================
                                // INTERNSHIPS TAB
                                // =====================================================
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showInternships = true;
                                      });
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),

                                      decoration: BoxDecoration(
                                        color: _showInternships
                                            ? Colors.black
                                            : Colors.transparent,

                                        borderRadius: BorderRadius.circular(18),
                                      ),

                                      child: Center(
                                        child: Text(
                                          "Internships",

                                          style: TextStyle(
                                            color: _showInternships
                                                ? Colors.white
                                                : Colors.black54,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // =====================================================
                                // PROJECTS TAB
                                // =====================================================
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showInternships = false;
                                      });
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),

                                      decoration: BoxDecoration(
                                        color: !_showInternships
                                            ? Colors.black
                                            : Colors.transparent,

                                        borderRadius: BorderRadius.circular(18),
                                      ),

                                      child: Center(
                                        child: Text(
                                          "Freelancing",

                                          style: TextStyle(
                                            color: !_showInternships
                                                ? Colors.white
                                                : Colors.black54,

                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        // =====================================================
                        // SEARCH ICON
                        // =====================================================
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSearching = true;
                            });
                          },

                          child: Container(
                            padding: const EdgeInsets.all(10),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius: BorderRadius.circular(18),

                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),

                                  blurRadius: 10,

                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),

                            child: const Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

        child: ListView.builder(
          itemCount: currentList.length,

          itemBuilder: (context, index) {
            final opp = currentList[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 20),

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(28),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),

                    blurRadius: 20,

                    spreadRadius: 1,

                    offset: const Offset(0, 8),
                  ),

                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),

                    blurRadius: 6,

                    offset: const Offset(0, 2),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // =====================================================
                  // TOP TAGS
                  // =====================================================
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.black,

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          opp.type,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: Colors.black12,

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Text(
                          opp.category,

                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // =====================================================
                  // TITLE
                  // =====================================================
                  Text(
                    opp.title,

                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // =====================================================
                  // COMPANY & LOCATION
                  // =====================================================
                  Row(
                    children: [
                      const Icon(
                        Icons.business_center_outlined,
                        size: 18,
                        color: Colors.black54,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          "${opp.company} · ${opp.location}",

                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // =====================================================
                  // APPLY BUTTON
                  // =====================================================
                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,

                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      onPressed: () {},

                      child: const Text(
                        "Apply Now",

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
