import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:livescore/routes.dart';
import 'package:livescore/views/all_settled_matches_screen.dart';
import 'package:livescore/views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateWithFadeTransition(BuildContext context, String routeName) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            // Map route name to target screen
            if (routeName == AppRoutes.homeRoute) {
              return const HomeScreen();
            }
            // Add other routes here if needed
            return const AllSettledMatchesScreen(); // Default route
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation, // Fade transition
              child: child,
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: Center(
        child: Image.asset('assets/images/premier_league-removebg-preview.png'),
      )
          .animate()
          .scaleXY(
            begin: 0.5,
            end: 1.3,
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOutCubic,
          )
          .shimmer(
            delay: const Duration(milliseconds: 10),
            duration: const Duration(seconds: 5),
          )
          .callback(
        callback: (_) {
          navigateWithFadeTransition(context, AppRoutes.homeRoute);
        },
      ),
    );
  }
}
