import 'package:disappear/models/chatbot_model.dart';
import 'package:disappear/services/chatbot_service.dart';
import 'package:flutter/material.dart';

class ChatbotViewModel extends ChangeNotifier {
  Future postQuestion(String message) async {
    try {
      final chatbotService = ChatbotService();
      return await chatbotService.postQuestion(message);
    } catch (e) {
      rethrow;
    }
  }

  Future postAnswer(String message) async {
    try {
      final chatbotService = ChatbotService();
      return await chatbotService.postAnswer(message);
    } catch (e) {
      rethrow;
    }
  }

  // Stream<ChatbotModel>getChat () async {
  //   try {
  //     await
  //   } catch (e) {

  //   }
  // }

  Future<List<ChatbotModel>> getChatHistory() async {
    try {
      final chatbotService = ChatbotService();
      return await chatbotService.getChatHistory();
    } catch (e) {
      rethrow;
    }
  }

  

}
