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
  bool _showInternships = true;
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final List<Opportunity> currentList = _showInternships
        ? internships
        : projects;

    final filtered = currentList
        .where(
          (opp) => opp.title.toLowerCase().contains(_query.toLowerCase()),
        )
        .toList();

    final topChoices = filtered
        .where((opp) => opp.category != 'DESIGN')
        .toList();
    final designFinds = filtered
        .where((opp) => opp.category == 'DESIGN')
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _topBar(),
              const SizedBox(height: 16),
              _searchBar(),
              const SizedBox(height: 16),
              _tabs(),
              const SizedBox(height: 20),
              Expanded(
                child: filtered.isEmpty
                    ? _buildEmptyState()
                    : ListView(
                  children: [
                    if (topChoices.isNotEmpty) ...[
                      _sectionHeader('Top Choices'),
                      const SizedBox(height: 15),
                      ...topChoices.map(_opportunityCard),
                    ],
                    if (designFinds.isNotEmpty) ...[
                      _sectionHeader('Design Finds'),
                      const SizedBox(height: 15),
                      ...designFinds.map(_opportunityCard),
                    ],
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // TOP BAR
  // =====================================================
  Widget _topBar() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Icon(Icons.notifications_none, color: AppColors.primaryDark),
    );
  }

  // =====================================================
  // SEARCH BAR
  // =====================================================
  Widget _searchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.textSecondary),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: (value) => setState(() => _query = value),
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: const InputDecoration(
                hintText: 'Search internships, skills or companies',
                hintStyle: TextStyle(color: AppColors.textSecondary),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // TABS
  // =====================================================
  Widget _tabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: _tabButton('Internships', _showInternships, true)),
          Expanded(child: _tabButton('Projects', !_showInternships, false)),
        ],
      ),
    );
  }

  Widget _tabButton(String label, bool selected, bool isInternships) {
    return GestureDetector(
      onTap: () => setState(() => _showInternships = isInternships),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryDark : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // =====================================================
  // EMPTY STATE
  // =====================================================
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/illustration_empty_state.png',
            width: 160,
          ),
          const SizedBox(height: 16),
          const Text(
            'No results found',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Try a different search term',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // SECTION HEADER
  // =====================================================
  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // =====================================================
  // AVATAR STACK
  // =====================================================
  Widget _avatarStack() {
    return SizedBox(
      width: 70,
      height: 28,
      child: Stack(
        children: [
          for (int i = 0; i < 3; i++)
            Positioned(
              left: i * 16,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.primary.withValues(
                    alpha: 0.7 - (i * 0.15),
                  ),
                ),
              ),
            ),
          Positioned(
            left: 48,
            child: Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '+12',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // OPPORTUNITY CARD
  // =====================================================
  Widget _opportunityCard(Opportunity opp) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.10),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP TAGS + AVATAR STACK
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 8,
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
                        opp.type[0] + opp.type.substring(1).toLowerCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                        opp.location,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _avatarStack(),
            ],
          ),

          const SizedBox(height: 18),

          // TITLE
          Text(
            opp.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 6),

          // COMPANY
          Text(
            opp.company,
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),

          const SizedBox(height: 18),

          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: opp.image.isNotEmpty
                ? Image.asset(
                    opp.image,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 130,
                    width: double.infinity,
                    color: AppColors.primary.withValues(alpha: 0.08),
                    child: Icon(
                      opp.category == 'DESIGN'
                          ? Icons.palette_outlined
                          : Icons.business_center_outlined,
                      color: AppColors.primary,
                      size: 36,
                    ),
                  ),
          ),

          const SizedBox(height: 20),

          // APPLY BUTTON
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
                'Apply Now',
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
  }
}
