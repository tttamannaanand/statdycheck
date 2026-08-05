import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../Core/color_codes.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;
  bool _obscurePassword = true;

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    bool showToggle = false,
    TextInputType keyboardType = TextInputType.text,
    IconData? icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 16,
            spreadRadius: 0,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: TextField(
        controller: controller,
        obscureText: obscure ? _obscurePassword : false,
        keyboardType: keyboardType,

        style: GoogleFonts.mukta(
          fontSize: 15,
          color: AppColors.primaryDark,
          letterSpacing: -0.8,
        ),

        decoration: InputDecoration(
          hintText: hint,

          hintStyle: GoogleFonts.mukta(
            fontSize: 14,
            color: Colors.grey.shade600,
            letterSpacing: -0.8,
          ),

          prefixIcon: icon != null
              ? Icon(icon, color: Colors.grey.shade600, size: 20)
              : null,

          suffixIcon: showToggle
              ? IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),

                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),

            borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
          ),

          filled: true,
          fillColor: AppColors.background,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFCCCCCC),

      body: Stack(
        children: [
          // BACKGROUND LOGO
          Container(
            height: size.height,

            decoration: const BoxDecoration(color: Color(0xFFCCCCCC)),

            child: Opacity(
              opacity: 0.35,

              child: Align(
                alignment: Alignment.topCenter,

                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),

                  child: Image.asset(
                    'assets/images/Group_17.png',
                    width: size.width,
                    height: size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // BOTTOM CARD
          Align(
            alignment: Alignment.bottomCenter,

            child: Container(
              height: _isLogin ? size.height * 0.60 : size.height * 0.68,

              width: double.infinity,

              decoration: const BoxDecoration(
                color: AppColors.background,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 24,
                    offset: Offset(0, -6),
                  ),
                ],
              ),

              padding: const EdgeInsets.fromLTRB(24, 36, 24, 24),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // TITLE
                    Text(
                      _isLogin ? 'Welcome Back' : 'Create Account',

                      style: GoogleFonts.mukta(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                        letterSpacing: -0.8,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // USERNAME
                    if (!_isLogin) ...[
                      _buildInputField(
                        controller: _usernameController,
                        hint: 'Username',
                        icon: Icons.person_outline,
                      ),

                      const SizedBox(height: 14),
                    ],

                    // EMAIL
                    _buildInputField(
                      controller: _emailController,
                      hint: 'Email / Phone',
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email_outlined,
                    ),

                    const SizedBox(height: 14),

                    // PASSWORD
                    _buildInputField(
                      controller: _passwordController,
                      hint: 'Password',
                      obscure: true,
                      showToggle: true,
                      icon: Icons.lock_outline,
                    ),

                    const SizedBox(height: 14),

                    // TOGGLE LOGIN / SIGNUP
                    Align(
                      alignment: Alignment.centerRight,

                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },

                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              _isLogin
                                  ? "Don't have an account "
                                  : "Already have an account ",

                              style: GoogleFonts.mukta(
                                fontSize: 13,
                                color: AppColors.primaryDark,
                                letterSpacing: -0.8,
                              ),
                            ),

                            const Icon(
                              Icons.arrow_forward,
                              color: AppColors.primary,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // BUTTON
                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 56,

                      child: ElevatedButton(
                        onPressed: () {
                          // LOGIN -> DIRECT NAVBAR
                          if (_isLogin) {
                            context.go('/main');
                          }
                          // SIGNUP -> ONBOARDING
                          else {
                            context.go('/onboarding');
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDark,
                          foregroundColor: AppColors.background,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),

                          elevation: 0,
                        ),

                        child: Text(
                          _isLogin ? 'Login' : 'Sign Up',

                          style: GoogleFonts.mukta(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.8,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // OTHER ACCOUNT
                    Center(
                      child: Text(
                        _isLogin
                            ? 'Sign in using another account'
                            : 'Sign up using another account',

                        style: GoogleFonts.mukta(
                          fontSize: 13,
                          color: Colors.grey,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // GOOGLE BUTTON
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },

                        child: Container(
                          width: 58,
                          height: 58,

                          decoration: BoxDecoration(
                            color: AppColors.background,

                            borderRadius: BorderRadius.circular(16),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),

                                blurRadius: 14,

                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(12),

                            child: Image.asset(
                              'assets/images/GoogleLogo.png',
                              width: 28,
                              height: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
