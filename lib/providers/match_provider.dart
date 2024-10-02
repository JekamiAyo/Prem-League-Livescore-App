import 'package:livescore/model/upcoming_matches.dart';
import 'package:livescore/services/livescore_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

import '../model/settled_matches.dart';
part 'match_provider.g.dart';

// @riverpod
// Future<LiveScore?> liveScore(ref) async {
//   final liveScoreApi = LiveScoreApi();
//   return await liveScoreApi.getLiveMatches();
// }

@riverpod
class SettledMatchesNotifier extends _$SettledMatchesNotifier {
  Timer? _timer;
  final Duration _fetchInterval = const Duration(seconds: 30);
  final liveScoreApi = LiveScoreApi();

  @override
  Future<SettledMatches?> build() async {
    _startPeriodicFetch();
    return await liveScoreApi.getSettledMatches();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(_fetchInterval, (timer) async {
      final newData = await liveScoreApi.getSettledMatches();
      state = AsyncValue.data(newData);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}

@riverpod
class UpcomingMatchesNotifier extends _$UpcomingMatchesNotifier {
  Timer? _timer;
  final Duration _fetchInterval = const Duration(seconds: 30);
  final liveScoreApi = LiveScoreApi();

  @override
  Future<UpcomingMatches?> build() async {
    _startPeriodicFetch();
    return await liveScoreApi.getUpcomingMatches();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(_fetchInterval, (timer) async {
      final newData = await liveScoreApi.getUpcomingMatches();
      state = AsyncValue.data(newData);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
