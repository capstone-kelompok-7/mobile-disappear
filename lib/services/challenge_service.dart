import 'package:dio/dio.dart';
import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/services/api.dart';

class ChallengeService {
  Future<List<ChallengesModel>> fetchAllChallenge() async {
    try {
      final dio = createDio();
      Response response = await dio.get('/challenges');

      return response.data['data']
          .map<ChallengesModel>(
            (data) => ChallengesModel(
              id: data['id'],
              title: data['title'],
              photo: data['photo'],
              startDate: data['start_date'],
              endDate: data['end_date'],
              description: data['description'],
              status: data['status'],
              exp: data['exp'],
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
