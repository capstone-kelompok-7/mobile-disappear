class ChatbotModel {
  late final String? id;
  late final int? userId;
  late final String role;
  late final String text;
  late final String? createdAt;

  ChatbotModel({
    this.id,
    this.userId,
    required this.role,
    required this.text,
    this.createdAt,
  });
}
