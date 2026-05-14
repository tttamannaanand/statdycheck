import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:stardy_app/Views/widgets/color_codes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _achieveController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  String _selectedPurpose = '';
  bool _usedBefore = false;

  @override
  void dispose() {
    _goalController.dispose();
    _achieveController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  Widget _buildProgressDots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          margin: const EdgeInsets.only(right: 6),
          width: index == _currentPage ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == _currentPage
                ? AppColors.primaryDark
                : AppColors.primaryDark.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildProgressDotsGrey() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          margin: const EdgeInsets.only(right: 6),
          width: index == _currentPage ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == _currentPage
                ? AppColors.primaryDark
                : AppColors.primaryDark.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildNavButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (_currentPage > 0) {
              setState(() => _currentPage--);
            }
          },
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == 0
                  ? Colors.white.withOpacity(0.2)
                  : AppColors.background,
              border: Border.all(
                color: _currentPage == 0
                    ? Colors.white.withOpacity(0.4)
                    : Colors.black12,
                width: 1,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: _currentPage == 0
                  ? Colors.white.withOpacity(0.5)
                  : AppColors.primaryDark,
              size: 22,
            ),
          ),
        ),
        _currentPage == 0 ? _buildProgressDots() : _buildProgressDotsGrey(),
        GestureDetector(
          onTap: () {
            if (_currentPage < 4) {
              setState(() => _currentPage++);
            } else {
              context.go('/main');
            }
          },
          child: _currentPage == 4
              ? Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Center(
                    child: Text(
                      'Finish',
                      style: GoogleFonts.mukta(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                        letterSpacing: -0.8,
                      ),
                    ),
                  ),
                )
              : Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == 0
                        ? AppColors.background
                        : AppColors.primaryDark,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: _currentPage == 0
                        ? AppColors.primaryDark
                        : AppColors.background,
                    size: 22,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildCard({required String question, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            question,
            style: GoogleFonts.mukta(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 20),
          content,
        ],
      ),
    );
  }

  Widget _buildTextInput({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: GoogleFonts.mukta(
          fontSize: 15,
          color: AppColors.primaryDark,
          letterSpacing: -0.8,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.mukta(
            fontSize: 14,
            color: Colors.grey.shade500,
            letterSpacing: -0.8,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    final options = [
      'Learn Skills',
      'Level Up',
      'Grow Career',
      'Freelancing',
      'Internship',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: options.map((option) {
        final isSelected = _selectedPurpose == option;
        return GestureDetector(
          onTap: () => setState(() => _selectedPurpose = option),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade300,
              ),
            ),
            child: Text(
              option,
              style: GoogleFonts.mukta(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.background
                    : AppColors.primaryDark,
                letterSpacing: -0.8,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildYesNo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => setState(() => _usedBefore = true),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 28,
                ),
                decoration: BoxDecoration(
                  color: _usedBefore ? AppColors.primary : AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _usedBefore
                        ? AppColors.primary
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  'Yes',
                  style: GoogleFonts.mukta(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: _usedBefore
                        ? AppColors.background
                        : AppColors.primaryDark,
                    letterSpacing: -0.8,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => setState(() => _usedBefore = false),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 28,
                ),
                decoration: BoxDecoration(
                  color: !_usedBefore
                      ? AppColors.primary
                      : AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: !_usedBefore
                        ? AppColors.primary
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  'No',
                  style: GoogleFonts.mukta(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: !_usedBefore
                        ? AppColors.background
                        : AppColors.primaryDark,
                    letterSpacing: -0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_usedBefore) ...[
          const SizedBox(height: 14),
          _buildTextInput(
            controller: _experienceController,
            hint: 'Tell us about your experience...',
            maxLines: 3,
          ),
        ],
      ],
    );
  }

  Widget _getCurrentCard() {
    switch (_currentPage) {
      case 1:
        return _buildCard(
          question: 'What is your\ncareer goal?',
          content: _buildTextInput(
            controller: _goalController,
            hint: 'e.g. Full Stack Developer',
          ),
        );
      case 2:
        return _buildCard(
          question: 'What is your purpose\nfor using Stardy AI?',
          content: _buildDropdown(),
        );
      case 3:
        return _buildCard(
          question: 'What do you expect\nto achieve?',
          content: _buildTextInput(
            controller: _achieveController,
            hint: 'Minimum 10 characters...',
            maxLines: 3,
          ),
        );
      case 4:
        return _buildCard(
          question: 'Have you used\nsimilar apps before?',
          content: _buildYesNo(),
        );
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          if (_currentPage == 0)
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFB51B39),
                    Color(0xFF1A0000),
                    Color(0xFF000000),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            )
          else
            Container(color: const Color(0xFFEEEEEE)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Logo
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryDark,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/Group_17.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Stardy .AI',
                        style: GoogleFonts.mukta(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _currentPage == 0
                              ? AppColors.background
                              : AppColors.primaryDark,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: _currentPage == 0
                        ? Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 40),
                              child: Text(
                                'Start your journey\nwith STARDY!',
                                style: GoogleFonts.mukta(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.background,
                                  letterSpacing: -0.8,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: SingleChildScrollView(
                              child: _getCurrentCard(),
                            ),
                          ),
                  ),

                  _buildNavButtons(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
