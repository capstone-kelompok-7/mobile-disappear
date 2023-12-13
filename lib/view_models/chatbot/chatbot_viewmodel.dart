import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:disappear/services/chatbot_service.dart';
import 'package:flutter/material.dart';

class ChatbotViewModel extends ChangeNotifier {
  Future postQuestion(ChatMessage m) async {
    try {
      final chatbotService = ChatbotService();
      return await chatbotService.postQuestion(m);
    } catch (e) {
      rethrow;
    }
  }

  Future postAnswer(ChatMessage m) async {
    try {
      final chatbotService = ChatbotService();
      return await chatbotService.postAnswer(m);
    } catch (e) {
      rethrow;
    }
  }
}
