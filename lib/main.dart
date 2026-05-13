import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/colors.dart';
import 'routes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: StardyApp(),
    ),
  );
}

class StardyApp extends StatelessWidget {
  const StardyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Stardy AI',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.black,
        textTheme: GoogleFonts.muktaTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
    );
  }
}
