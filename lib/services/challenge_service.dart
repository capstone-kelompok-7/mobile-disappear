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

  Future<ChallengesModel> getChallengeById(int id) async {
    final dio = createDio();

    final Response response = await dio.get('/challenges/$id');
    final data = response.data['data'];

    final challengesById = ChallengesModel(
      id: data['id'] as int,
      title: data['title'] as String,
      photo: data['photo'] as String,
      startDate: data['start_date'] as String,
      endDate: data['end_date'] as String,
      description: data['description'] as String,
      status: data['status'] as String,
      exp: data['exp'] as int,
    );

    return challengesById;
  }
}
