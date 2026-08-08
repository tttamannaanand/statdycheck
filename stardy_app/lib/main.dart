import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './Routers/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // No Firebase project is wired up yet (no google-services.json /
  // GoogleService-Info.plist) — this fails until one is added via
  // `flutterfire configure`. Catching it here keeps the app usable in the
  // meantime instead of crashing on launch.
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase not configured: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // CONNECTED GOROUTER
      routerConfig: appRouter,

      title: 'Stardy AI',
    );
  }
}
