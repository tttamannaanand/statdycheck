import 'package:go_router/go_router.dart';

import '../Views/widgets/NavBar.dart';

import '../Views/screens/splash_screen.dart';
import '../Views/Pages/signup.dart';
import '../Views/onboarding/onboarding_screen.dart';

import '../Views/screens/profile_screen.dart';
import '../Views/screens/settings_screen.dart';
import '../Views/screens/uiux_screen.dart';
import '../Views/screens/frontend_screen.dart';
import '../Views/screens/data_analyst_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',

  routes: [
    GoRoute(
      path: '/splash',
      builder:
          (context, state) =>
              const SplashScreen(),
    ),

    GoRoute(
      path: '/auth',
      builder:
          (context, state) =>
              const AuthPage(),
    ),

    GoRoute(
      path: '/onboarding',
      builder:
          (context, state) =>
              const OnboardingScreen(),
    ),

    GoRoute(
      path: '/main',
      builder:
          (context, state) =>
              const NavbarPage(),
    ),

    GoRoute(
      path: '/profile',
      builder:
          (context, state) =>
              const ProfileScreen(),
    ),

    GoRoute(
      path: '/settings',
      builder:
          (context, state) =>
              const SettingsScreen(),
    ),

    GoRoute(
      path: '/uiux',
      builder:
          (context, state) =>
              const UiUxScreen(),
    ),

    GoRoute(
      path: '/frontend',
      builder:
          (context, state) =>
              const FrontendScreen(),
    ),

    GoRoute(
      path: '/data',
      builder:
          (context, state) =>
              const DataAnalystScreen(),
    ),
  ],
);