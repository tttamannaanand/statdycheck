import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stardy_app/Views/widgets/color_codes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();
  final TextEditingController _achieveController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  bool _usedBefore = false;

  static const _pageCount = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.86);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _goalController.dispose();
    _purposeController.dispose();
    _achieveController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    if (page < 0 || page >= _pageCount) return;
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
    );
  }

  Widget _buildProgressDots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_pageCount, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.only(right: 6),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primaryDark
                : AppColors.primaryDark.withValues(
                    alpha: _currentPage == 0 ? 0.4 : 0.2,
                  ),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  Widget _buildNavButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProgressDots(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TapScale(
              onTap: () => _goToPage(_currentPage - 1),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == 0
                      ? Colors.white.withValues(alpha: 0.2)
                      : AppColors.background,
                  border: Border.all(
                    color: _currentPage == 0
                        ? Colors.white.withValues(alpha: 0.4)
                        : Colors.black12,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: _currentPage == 0
                      ? Colors.white.withValues(alpha: 0.5)
                      : AppColors.primaryDark,
                  size: 22,
                ),
              ),
            ),
            _TapScale(
              onTap: () => _goToPage(_currentPage + 1),
              child: Container(
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
            _TapScale(
              onTap: () => context.go('/auth'),
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                decoration: BoxDecoration(
                  color: _currentPage == 0
                      ? Colors.white.withValues(alpha: 0.2)
                      : AppColors.primaryDark,
                  borderRadius: BorderRadius.circular(32),
                  border: _currentPage == 0
                      ? Border.all(color: Colors.white.withValues(alpha: 0.4))
                      : null,
                ),
                child: Center(
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.background,
                      letterSpacing: -0.8,
                    ),
                  ),
                ),
              ),
            ),
          ],
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
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
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
            style: TextStyle(
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
        style: TextStyle(
          fontSize: 15,
          color: AppColors.primaryDark,
          letterSpacing: -0.8,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
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

  Widget _buildYesNoOption({required String label, required bool selected}) {
    return _TapScale(
      onTap: () => setState(() => _usedBefore = label == 'Yes'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: selected ? AppColors.background : AppColors.primaryDark,
            letterSpacing: -0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildYesNo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildYesNoOption(label: 'Yes', selected: _usedBefore),
            const SizedBox(width: 12),
            _buildYesNoOption(label: 'No', selected: !_usedBefore),
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

  Widget _buildIntroPage() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Text(
          'Start your journey\nwith STARDY!',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.background,
            letterSpacing: -0.8,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildPageAt(int index) {
    switch (index) {
      case 0:
        return _buildIntroPage();
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
          question: 'Define the Purpose for\nusing Stardy AI ?',
          content: _buildTextInput(
            controller: _purposeController,
            hint: 'Write in 50 words',
            maxLines: 4,
          ),
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
          // Background — crossfades between the intro's dark gradient and
          // the light gradient used by the question cards.
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _currentPage == 0
                ? Container(
                    key: const ValueKey('dark-bg'),
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
                : Container(
                    key: const ValueKey('light-bg'),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Color(0xff9A9A9A)],
                      ),
                    ),
                  ),
          ),

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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _currentPage == 0
                              ? AppColors.background
                              : AppColors.primary,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ],
                  ),

                  // Swipeable pages — adjacent pages peek in at the edges.
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _pageCount,
                      onPageChanged: (i) => setState(() => _currentPage = i),
                      itemBuilder: (context, index) {
                        return AnimatedBuilder(
                          animation: _pageController,
                          builder: (context, child) {
                            double scale = 1.0;
                            double opacity = 1.0;
                            if (_pageController.position.haveDimensions) {
                              final page =
                                  _pageController.page ??
                                  _currentPage.toDouble();
                              final distance = (page - index).abs().clamp(
                                0.0,
                                1.0,
                              );
                              scale = 1.0 - (distance * 0.12);
                              opacity = 1.0 - (distance * 0.5);
                            }
                            return Center(
                              child: Opacity(
                                opacity: opacity,
                                child: Transform.scale(
                                  scale: scale,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: index == 0
                                ? _buildPageAt(index)
                                : SingleChildScrollView(
                                    child: _buildPageAt(index),
                                  ),
                          ),
                        );
                      },
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

// ───────────────── TAP SCALE MICROINTERACTION ─────────────────
class _TapScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _TapScale({required this.child, this.onTap});

  @override
  State<_TapScale> createState() => _TapScaleState();
}

class _TapScaleState extends State<_TapScale> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => setState(() => _scale = 0.92),
      onTapUp: (_) => setState(() => _scale = 1.0),
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
