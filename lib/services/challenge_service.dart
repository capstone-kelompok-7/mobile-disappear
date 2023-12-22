import 'package:dio/dio.dart';
import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class ChallengeService {
  Future<List<Challenge>> fetchAllChallenge() async {
    try {
      final dio = createDio();
      Response response = await dio.get('/challenges');

      return response.data['data']
        .map<Challenge>((data) => Challenge.fromJson(data))
        .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Challenge> getChallengeById(int id) async {
    final dio = createDio();

    final Response response = await dio.get('/challenges/$id');
    final data = response.data['data'];

    final challengesById = Challenge.fromJson(data);

    return challengesById;
  }

  Future<dynamic> postSubmitChallenge(int id, String? username, String filePath) async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles();

    // if (result != null && result.files.isNotEmpty) {
    //   String? filePath = result.files.single.path;

    //   if (filePath != null) {
        final dio = createDio();

        // Create FormData
        FormData formData = FormData.fromMap({
          'challenge_id': id.toString(), // Add id field
          'username': username, // Add username field
          'image': await MultipartFile.fromFile(filePath,
              filename: filePath.split('/').last),
        });

        try {
          final Response response = await dio.post(
            '/challenges/submit',
            data: formData,
          );
          if (response.statusCode == 200 || response.statusCode == 201) {
            // Successful response
            final responseData = response.data;
            // Assuming your response is a JSON string, you might parse it
            // to a Map<String, dynamic> if it's a JSON object.
            if (responseData is Map<String, dynamic>) {
              // Handle the response data here
              debugPrint(responseData.toString());
              return responseData; // Return data if needed
            } else {
              // Handle unexpected response format
              debugPrint('Unexpected response format');
            }
          } else {
            // Handle non-200 status code
            debugPrint('Non-200 status code: ${response.statusCode}');
          }

          // debugPrint(response.data.toString());
          // return response.data;
        } on DioException catch (e) {
          if (e.response != null) {
            debugPrint(e.response!.data.toString()); // Response data from server
          } else {
            debugPrint('Dio Error:');
            debugPrint(e.message); // General error message
          }
          rethrow;
        }
      }
    }
//   }
// }
