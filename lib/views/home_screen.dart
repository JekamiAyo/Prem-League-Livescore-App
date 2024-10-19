import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livescore/constants.dart';
import 'package:livescore/providers/match_provider.dart';
import 'package:livescore/routes.dart';
import 'package:lottie/lottie.dart';

import '../model/livescore.dart';
import '../providers/livescores_provider.dart';
import '../widgets/big_match_card.dart';
import '../widgets/settled__match_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveScores = ref.watch(liveScoreNotifierProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        body: SafeArea(
          child: liveScores.when(
            data: (data) {
              return Body(
                liveScores: data!.response,
              );
            },
            error: ((error, stackTrace) =>
                Center(child: Text('Error: $error'))),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final List<Response>? liveScores;

  const Body({
    super.key,
    required this.liveScores,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //appbar
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 25.0).copyWith(top: 8),
          child: Row(
            children: [
              const SizedBox(
                width: 40,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/images/Image.png'),
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/premier_league-removebg-preview.png',
                width: 55,
              ),
              const Text(
                'LiveScore',
                style: TextStyle(fontSize: 22),
              ),
              const Spacer(),
              SizedBox(
                width: 40,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
              ),
            ],
          ),
        ),

        //live match text
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 10).copyWith(left: 25.0),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Live Matches',
              style: TextStyle(fontSize: 23),
            ),
          ),
        ),

        //big live card listview
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 220,
            child: liveScores != null
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: liveScores!.length,
                    padding: const EdgeInsets.only(left: 25),
                    itemBuilder: (context, index) {
                      final liveScore = liveScores![index];
                      return BigMatchCard(
                        response: liveScore,
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/Soccer Animation - 1727858408515.json', // Replace with your Lottie file path
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        "No Ongoing Premiere League match",
                      ),
                    ],
                  ),
          ),
        ),
        const TabBar(
          tabs: [
            Tab(
              text: 'Upcoming',
            ),
            Tab(
              text: 'Settled',
            )
          ],
          indicatorColor: ColorPallete.amber,
          labelStyle: TextStyle(
            color: ColorPallete.amber,
          ),
        ),

        Flexible(
          child: TabBarView(
            children: [
              Column(
                children: [
                  // upcoming matchs text
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Upcoming Matches',
                          style: TextStyle(fontSize: 23),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.allUpcomingMatchesRoute);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorPallete.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //other live matches
                  const UpcomingMatchesListView(),
                ],
              ),
              // settled matchs text
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Settled Matches',
                          style: TextStyle(fontSize: 23),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.allSettledMatchesRoute);
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorPallete.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //other live matches
                  const SettledMatchesListView(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UpcomingMatchesListView extends ConsumerWidget {
  const UpcomingMatchesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(upcomingMatchesNotifierProvider);
    // / previousMatches: matches.value!.response,
    return matches.when(
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
            itemCount: settledMatches.length < 7 ? settledMatches.length : 7,
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
            SizedBox(height: 100),
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}

class SettledMatchesListView extends ConsumerWidget {
  const SettledMatchesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matches = ref.watch(settledMatchesNotifierProvider);
    // / previousMatches: matches.value!.response,
    return matches.when(
      data: (match) {
        final settledMatches = match!.response;
        // Sort matches by date in descending order (latest first)
        settledMatches!.sort((a, b) {
          final dateA = DateTime.parse(a.fixture!.date!);
          final dateB = DateTime.parse(b.fixture!.date!);
          return dateB.compareTo(dateA); // For latest matches first
        });
        return Expanded(
          child: ListView.builder(
            itemCount: settledMatches.length < 7 ? settledMatches.length : 7,
            itemBuilder: (context, index) {
              final settledMatch = settledMatches[index];
              return SettledMatchCard(settledMatch: settledMatch);
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
            SizedBox(height: 100),
            CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}

// class NoonLoopingDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Noon-looping carousel demo')),
//       body: Container(
//           child: CarouselSlider(
//         options: CarouselOptions(
//           aspectRatio: 2.0,
//           enlargeCenterPage: true,
//           enableInfiniteScroll: false,
//           initialPage: 2,
//           autoPlay: true,
//         ),
//         items: imageSliders,
//       )),
//     );
//   }
// }
