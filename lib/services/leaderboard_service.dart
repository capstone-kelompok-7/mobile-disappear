import 'package:dio/dio.dart';
import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/services/api.dart';

class LeaderboardService {
  Future<List<Leaderboard>> fetchLeaderboard() async {
    try {
      final dio = createDio();
      Response response = await dio.get('/users/leaderboard');

      List<Leaderboard> leaderboardList = response.data['data']
          .map<Leaderboard>((data) => Leaderboard.fromMap(data))
          .toList();

      return leaderboardList;
    } catch (e) {
      rethrow;
    }
  }
}
