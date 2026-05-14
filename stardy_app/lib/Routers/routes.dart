import 'package:go_router/go_router.dart';
import 'package:stardy_app/Views/widgets/NavBar.dart';

import '../Views/screens/splash_screen.dart';
import '../Views/Pages/signup.dart';
import '../Views/onboarding/onboarding_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    // SPLASH
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),

    // AUTH
    GoRoute(path: '/auth', builder: (context, state) => const AuthPage()),

    // ONBOARDING
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // MAIN NAVBAR APP
    GoRoute(path: '/main', builder: (context, state) => const NavbarPage()),
  ],
);
