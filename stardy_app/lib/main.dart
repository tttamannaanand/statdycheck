import 'package:flutter/material.dart';

import './Routers/routes.dart';

void main() {
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
