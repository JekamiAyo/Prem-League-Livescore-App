import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apikey.dart';
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
      'x-rapidapi-key': apikey,
      'x-rapidapi-host': "api-football-v1.p.rapidapi.com"
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('live_matches');
    final cachedTimestamp = prefs.getInt('live_matches_timestamp');

    // Cache expiration logic (5 minutes)
    if (cachedData != null && cachedTimestamp != null &&
        DateTime.now().millisecondsSinceEpoch - cachedTimestamp < 5 * 60 * 1000) {
      return liveScoreFromJson(cachedData); // Use cached data if still valid
    }

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        // Cache the response and timestamp
        prefs.setString('live_matches', jsonBody);
        prefs.setInt('live_matches_timestamp', DateTime.now().millisecondsSinceEpoch);
        return liveScoreFromJson(jsonBody);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
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
      'x-rapidapi-key': apikey,
      'x-rapidapi-host': "api-football-v1.p.rapidapi.com"
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('settled_matches');
    final cachedTimestamp = prefs.getInt('settled_matches_timestamp');

    // Cache expiration logic (5 minutes)
    if (cachedData != null && cachedTimestamp != null &&
        DateTime.now().millisecondsSinceEpoch - cachedTimestamp < 5 * 60 * 1000) {
      return matchFromJson(cachedData); // Use cached data if still valid
    }

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        // Cache the response and timestamp
        prefs.setString('settled_matches', jsonBody);
        prefs.setInt('settled_matches_timestamp', DateTime.now().millisecondsSinceEpoch);
        return matchFromJson(jsonBody);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
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
      'x-rapidapi-key': apikey,
      'x-rapidapi-host': "api-football-v1.p.rapidapi.com"
    };

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString('upcoming_matches');
    final cachedTimestamp = prefs.getInt('upcoming_matches_timestamp');

    // Cache expiration logic (5 minutes)
    if (cachedData != null && cachedTimestamp != null &&
        DateTime.now().millisecondsSinceEpoch - cachedTimestamp < 5 * 60 * 1000) {
      return upcomingMatchesFromJson(cachedData); // Use cached data if still valid
    }

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var jsonBody = response.body;
        // Cache the response and timestamp
        prefs.setString('upcoming_matches', jsonBody);
        prefs.setInt('upcoming_matches_timestamp', DateTime.now().millisecondsSinceEpoch);
        return upcomingMatchesFromJson(jsonBody);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}