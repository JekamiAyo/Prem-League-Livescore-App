import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:livescore/model/upcoming_matches.dart';

import '../constants.dart';
import '../model/settled_matches.dart';

class SettledMatchCard extends StatelessWidget {
  const SettledMatchCard({
    super.key,
    required this.settledMatch,
  });

  final Responses settledMatch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffE5E1E6),
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  child: Text(
                    settledMatch.teams!.home!.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: settledMatch.teams!.home!.logo!,
                  height: 35,
                  width: 35,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${settledMatch.goals!.home!} - ${settledMatch.goals!.away!}',
                    style: const TextStyle(
                        color: ColorPallete.amber, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.Md()
                        .format(DateTime.parse(settledMatch.fixture!.date!)),
                    style: const TextStyle(
                        color: ColorPallete.amber, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: settledMatch.teams!.away!.logo!,
                  height: 35,
                  width: 35,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  child: Text(
                    settledMatch.teams!.away!.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UpcomingMatchCard extends StatelessWidget {
  const UpcomingMatchCard({
    super.key,
    required this.upcomingMatch,
  });

  final Responsess upcomingMatch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        margin: const EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0xffE5E1E6),
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  child: Text(
                    upcomingMatch.teams!.home!.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: upcomingMatch.teams!.home!.logo!,
                  height: 35,
                  width: 35,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat.Hm()
                        .format(DateTime.parse(upcomingMatch.fixture!.date!)),
                    style: const TextStyle(
                        color: ColorPallete.amber, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.MMMd()
                        .format(DateTime.parse(upcomingMatch.fixture!.date!)),
                    style: const TextStyle(fontSize: 11.5),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: upcomingMatch.teams!.away!.logo!,
                  height: 35,
                  width: 35,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  child: Text(
                    upcomingMatch.teams!.away!.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
