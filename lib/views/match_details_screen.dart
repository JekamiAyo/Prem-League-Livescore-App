import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        title: const Text(
          'Settled Matches',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        scrolledUnderElevation: 0,
      ),
    );
  }
}
