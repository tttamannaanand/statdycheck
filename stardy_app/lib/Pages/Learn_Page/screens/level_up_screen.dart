import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelUpScreen extends StatelessWidget {
  const LevelUpScreen({
    super.key,
    this.level = 3,
    this.xpEarned = 7750,
    this.shareXp = 250,
    this.onContinue,
  });

  final int level;
  final int xpEarned;
  final int shareXp;
  final VoidCallback? onContinue;

  static const Color _accentRed = Color(0xFFBE1E4A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.chevron_left_rounded, size: 26),
                ),
              ),
              const Spacer(),
              Center(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipPath(
                    clipper: _HexagonClipper(),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF3A3A3A), Color(0xFF1A1A1A)],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$level',
                          style: GoogleFonts.mukta(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'LEVEL UP!',
                  style: GoogleFonts.mukta(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _rewardTile(
                    icon: SizedBox(
                      width: 46,
                      height: 46,
                      child: ClipPath(
                        clipper: _HexagonClipper(),
                        child: Container(
                          color: Colors.white,
                          child: const Center(
                            child: Icon(Icons.shield_outlined, color: _accentRed, size: 22),
                          ),
                        ),
                      ),
                    ),
                    title: 'Badge',
                    subtitle: 'New badge',
                  ),
                  _rewardTile(
                    icon: Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(color: _accentRed, shape: BoxShape.circle),
                      child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 24),
                    ),
                    title: '+${_formatNumber(xpEarned)}',
                    subtitle: 'XP Earned',
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  onPressed: onContinue ?? () => Navigator.pop(context),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.mukta(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share the News',
                      style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: const BoxDecoration(color: _accentRed, shape: BoxShape.circle),
                          child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 16),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '+$shareXp',
                          style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rewardTile({required Widget icon, required String title, required String subtitle}) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 10),
        Text(title, style: GoogleFonts.mukta(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 2),
        Text(subtitle, style: GoogleFonts.mukta(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }

  static String _formatNumber(int value) {
    final str = value.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buffer.write(',');
      buffer.write(str[i]);
    }
    return buffer.toString();
  }
}

class _HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double w = size.width;
    final double h = size.height;
    return Path()
      ..moveTo(w * 0.5, 0)
      ..lineTo(w, h * 0.25)
      ..lineTo(w, h * 0.75)
      ..lineTo(w * 0.5, h)
      ..lineTo(0, h * 0.75)
      ..lineTo(0, h * 0.25)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
