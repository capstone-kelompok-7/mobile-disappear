class ChatbotModel {
  late final String id;
  late final int userId;
  late final String role;
  late final String text;
  late final DateTime createdAt;

  ChatbotModel({
    required this.id,
    required this.userId,
    required this.role,
    required this.text,
    required this.createdAt,
  });
}
