import 'dart:async';

import 'package:dio/dio.dart';
import 'package:disappear/models/chatbot_model.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/material.dart';

class ChatbotService {
  Future postQuestion(String message) async {
    try {
      final dio = createDio();
      Response response = await dio.post(
        '/assistant/question',
        data: {
          "text": message,
        },
      );
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      debugPrint('Dio Error: $e');
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
  Future postAnswer(String message) async {
    try {
      final dio = createDio();
      Response response = await dio.post(
        '/assistant/answer',
        data: {
          "text": message,
        },
      );
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      debugPrint('Dio Error: $e');
      rethrow;
    }
  }

  //  Stream<ChatbotModel> getChat() async* {
  //   final dio = createDio();
  //   try {
  //     final Response response = await dio.get('/chatbot');
  //     final chatbotModel = ChatbotModel.fromJson(response.data);
  //     _controller.add(chatbotModel); // Emit the fetched data through the stream
  //     yield* _controller.stream;
  //   } catch (e) {
  //     // Handle error
  //     print('Error: $e');
  //     _controller.addError(e); // Emit error through the stream
  //   }
  // }

  Future<List<ChatbotModel>> getChatHistory() async {
    try {
      final dio = createDio();
      Response response = await dio.get('/assistant');

      return (response.data['data'] ?? [])
          .map<ChatbotModel>(
            (data) => ChatbotModel(
              id: data['id'],
              userId: data['user_id'],
              role: data['role'],
              createdAt: data['created_at'],
              text: data['text'],
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
