import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/livescore.dart';
import '../model/settled_matches.dart';
import '../model/upcoming_matches.dart';

class LiveScoreApi {
  Future<LiveScore?> getLiveMatches() async {
    final now = DateTime.now();
    String formatter = DateFormat('y').format(now);

    String url =
        'https://api-football-v1.p.rapidapi.com/v3/fixtures?live=all&league=39&season=$formatter';
    const headers = {
      'x-rapidapi-key': "15104a897cmsh4c08fe94ae48868p1cfa4fjsn9c42dfc5dd0f",
      'x-rapidapi-host': "api-football-v1.p.rapidapi.com"
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        return liveScoreFromJson(jsonBody);
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
    }
    return null;
  }

  Future<SettledMatches?> getSettledMatches() async {
    final now = DateTime.now();
    String formatter = DateFormat('y').format(now);

    String url =
        "https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=$formatter&status=FT";
    const headers = {
      'x-rapidapi-key': "15104a897cmsh4c08fe94ae48868p1cfa4fjsn9c42dfc5dd0f",
      'x-rapidapi-host': "api-football-v1.p.rapidapi.com"
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        return matchFromJson(jsonBody);
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
    }
    return null;
  }
    Future<UpcomingMatches?> getUpcomingMatches() async {
    final now = DateTime.now();
    String formatter = DateFormat('y').format(now);

    String url =
        "https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=$formatter&status=NS";
    const headers = {
      'x-rapidapi-key': "15104a897cmsh4c08fe94ae48868p1cfa4fjsn9c42dfc5dd0f",
      'x-rapidapi-host': "api-football-v1.p.rapidapi.com"
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        return upcomingMatchesFromJson(jsonBody);
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
    }
    return null;
  }
}
