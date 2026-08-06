import 'package:flutter/material.dart';
import '../widgets/color_codes.dart';
import 'module_list_page.dart';

class _UpcomingModule {
  final String title;
  final String level;
  final String image;

  const _UpcomingModule({
    required this.title,
    required this.level,
    required this.image,
  });
}

const List<_UpcomingModule> _upcoming = [
  _UpcomingModule(
    title: 'Basics of Figma',
    level: 'Beginner',
    image: 'assets/images/module_figma_basics.png',
  ),
  _UpcomingModule(
    title: 'Design Systems 101',
    level: 'Intermediate',
    image: 'assets/images/module_color_tokens.png',
  ),
];

class CareerPathDetailPage extends StatelessWidget {
  final String pathName;

  const CareerPathDetailPage({super.key, required this.pathName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHero(context),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: const RouteSettings(name: '/module-list'),
                          builder: (_) => ModuleListPage(pathName: pathName),
                        ),
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ..._upcoming.map((m) => _buildUpcomingCard(context, m)),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  // ───────────────── HERO CARD ─────────────────
  Widget _buildHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        image: const DecorationImage(
          image: AssetImage('assets/images/texture_dark_grid.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.notifications_none, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            pathName.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'UI/UX Design focuses on creating intuitive, user-centered '
            'digital experiences by combining visual design with usability '
            'principles. It involves understanding user needs,',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white38),
                ),
                child: const Icon(Icons.arrow_outward, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white38),
                ),
                child: const Text(
                  'Skills to Know',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: const [
              _BulletText('Empathy'),
              _BulletText('Research'),
              _BulletText('User Testing'),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white38),
                ),
                child: const Icon(Icons.timer_outlined, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white38),
                ),
                child: const Text(
                  '5 Hours',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: '/module-list'),
                    builder: (_) => ModuleListPage(pathName: pathName),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Start Course',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────── UPCOMING CARD ─────────────────
  Widget _buildUpcomingCard(BuildContext context, _UpcomingModule module) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            settings: const RouteSettings(name: '/module-list'),
            builder: (_) => ModuleListPage(pathName: pathName),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                module.image,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      module.level,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    module.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  final String text;
  const _BulletText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      '•  $text',
      style: const TextStyle(color: Colors.white70, fontSize: 13),
    );
  }
}
