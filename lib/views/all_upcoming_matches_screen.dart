import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/match_provider.dart';
import '../widgets/settled__match_card.dart';

class AllUpcomingMatchesScreen extends ConsumerWidget {
  const AllUpcomingMatchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(upcomingMatchesNotifierProvider);
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F7),
        title: const Text(
          'Upcoming Matches',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            matches.when(
              data: (match) {
                final settledMatches = match!.response;
                // Sort matches by date in descending order (latest first)
                settledMatches!.sort((a, b) {
                  final dateA = DateTime.parse(a.fixture!.date!);
                  final dateB = DateTime.parse(b.fixture!.date!);
                  return dateA.compareTo(dateB); // For latest matches first
                });
                return Expanded(
                  child: ListView.builder(
                    itemCount: settledMatches.length,
                    itemBuilder: (context, index) {
                      final settledMatch = settledMatches[index];
                      return UpcomingMatchCard(upcomingMatch: settledMatch);
                    },
                  ),
                );
              },
              error: (err, stacktr) {
                return const Text("error");
              },
              loading: () {
                return const Column(
                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
