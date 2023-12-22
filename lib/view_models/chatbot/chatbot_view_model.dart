import 'package:disappear/models/chatbot_model.dart';
import 'package:disappear/services/chatbot_service.dart';
import 'package:flutter/material.dart';

class ChatbotViewModel extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  List<ChatbotModel> listMessages = [];

  final TextEditingController textController = TextEditingController();

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

  Future<List<ChatbotModel>> getChatHistory() async {
    try {
      final chatbotService = ChatbotService();
      return await chatbotService.getChatHistory();
    } catch (e) {
      rethrow;
    }
  }

  void sendMessage() async {
    if (textController.text.isNotEmpty) {
      final question = textController.text;
      textController.clear();

      listMessages.add(ChatbotModel(role: 'question', text: question));
      notifyListeners();
      
      //posting question
      postQuestion(question);

      // Posting answer
      final responseAnswer = await postAnswer(question);

      listMessages.add(
        ChatbotModel(role: 'answer', text: responseAnswer['data']),
      );
      notifyListeners();
    }
  }

  void getChatHistoryInit() async {
    listMessages = [];

    final histories = await getChatHistory();

    for (var element in histories) {
      listMessages.add(element);
    }

    notifyListeners();
  }
}
