import 'package:go_router/go_router.dart';
import 'package:stardy_app/Pages/Profile.dart';
import 'package:stardy_app/Views/widgets/NavBar.dart';

import '../Views/screens/splash_screen.dart';
import '../Pages/signup.dart';
import '../Views/onboarding/onboarding_screen.dart';

// PROFILE SCREENS
import '../Views/Profile_Source/features/profile/presentation/screens/settings_screen.dart';
import '../Views/Profile_Source/features/profile/presentation/screens/uiux_screen.dart';
import '../Views/Profile_Source/features/profile/presentation/screens/frontend_screen.dart';
import '../Views/Profile_Source/features/profile/presentation/screens/data_analyst_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    // =====================================================
    // SPLASH
    // =====================================================
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),

    // =====================================================
    // AUTH
    // =====================================================
    GoRoute(path: '/auth', builder: (context, state) => const AuthPage()),

    // =====================================================
    // ONBOARDING
    // =====================================================
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // =====================================================
    // MAIN NAVBAR APP
    // =====================================================
    GoRoute(path: '/main', builder: (context, state) => const NavbarPage()),

    // =====================================================
    // PROFILE ROUTES
    // =====================================================
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),

    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),

    GoRoute(path: '/uiux', builder: (context, state) => const UiUxScreen()),

    GoRoute(
      path: '/frontend',
      builder: (context, state) => const FrontendScreen(),
    ),

    GoRoute(
      path: '/data-analyst',
      builder: (context, state) => const DataAnalystScreen(),
    ),
  ],
);
