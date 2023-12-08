import 'package:dio/dio.dart';
import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/services/api.dart';

class LeaderboardService {
  Future<List<LeaderboardModel>> fetchLeaderboard() async {
    try {
      final dio = createDio();
      Response response = await dio.get('/users/leaderboard');

      List<LeaderboardModel> leaderboardList = response.data['data']
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

      return leaderboardList;
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchFirstLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboardList = await fetchLeaderboard();

      if (leaderboardList.isNotEmpty) {
        return leaderboardList.first;
      } else {
        return null; // Return null if the list is empty
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchSecondLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboardList = await fetchLeaderboard();

      if (leaderboardList.length >= 2) {
        return leaderboardList[1];
      } else {
        return null; // Return null if the list is empty
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchThirdLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboardList = await fetchLeaderboard();

      if (leaderboardList.length >= 3) {
        return leaderboardList[2];
      } else {
        return null; // Return null if the list is empty
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchFourthLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboardList = await fetchLeaderboard();

      if (leaderboardList.length >= 4) {
        return leaderboardList[4];
      } else {
        return null; // Return null if the list is empty
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchFifthLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboardList = await fetchLeaderboard();

      if (leaderboardList.length == 5) {
        return leaderboardList[5];
      } else {
        return null; // Return null if the list is empty
      }
    } catch (e) {
      rethrow;
    }
  }
}
