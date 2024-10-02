import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livescore/routes.dart';
import 'package:livescore/views/all_settled_matches_screen.dart';
import 'package:livescore/views/splash_screen.dart';

import 'constants.dart';
import 'views/all_upcoming_matches_screen.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiveScore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: ColorPallete.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        AppRoutes.homeRoute: (context) => const HomeScreen(),
        AppRoutes.allSettledMatchesRoute: (context) =>
            const AllSettledMatchesScreen(),
        AppRoutes.allUpcomingMatchesRoute: (context) =>
            const AllUpcomingMatchesScreen(),
      },
    );
  }
}
