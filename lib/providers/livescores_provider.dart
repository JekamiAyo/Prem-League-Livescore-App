import 'package:livescore/model/livescore.dart';
import 'package:livescore/services/livescore_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';
part 'livescores_provider.g.dart';

@riverpod
class LiveScoreNotifier extends _$LiveScoreNotifier {
  Timer? _timer;
  final Duration _fetchInterval = const Duration(seconds: 30);
  final liveScoreApi = LiveScoreApi();

  @override
  Future<LiveScore?> build() async {
    _startPeriodicFetch();
    return await liveScoreApi.getLiveMatches();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(_fetchInterval, (timer) async {
      final newData = await liveScoreApi.getLiveMatches();
      state = AsyncValue.data(newData);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
