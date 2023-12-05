import 'package:dio/dio.dart';
import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/services/api.dart';

class LeaderboardService {
  Future<List<LeaderboardModel>> fetchLeaderboard() async {
    try {
      final dio = createDio();
      Response response = await dio.get('/users/leaderboard');

      return response.data['data']
          .map<LeaderboardModel>(
            (data) => LeaderboardModel(
              id: data['id'],
              name: data['name'],
              level: data['level'],
              photoProfile: data['photo_profile'],
              totalChallenge: data['total_challenge'],
              totalGram: data['total_gram'],
              exp: data['exp'],
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
