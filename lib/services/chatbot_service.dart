import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dio/dio.dart';
import 'package:disappear/services/api.dart';

class ChatbotService {
  Future postQuestion(ChatMessage m) async {
    try {
      final dio = createDio();
      Response response = await dio.post(
        '/chatbot/question',
        data: {
          "text": m,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Future postAnswer(dynamic questionData) async {
  //   try {
  //     final dio = createDio();
  //     Response response = await dio.post(
  //       '/chatbot/answer',
  //       data: questionData,
  //     );
  //     return response.data;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future postAnswer(ChatMessage m) async {
    try {
      final dio = createDio();
      Response response = await dio.post(
        '/chatbot/answer',
        data: {
          "text": m,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
